/**
 *  Community Squeeze Configuration Web-GUI
 *
 *  Copyright (C) 2013  Clive Messer <clive.m.messer@gmail.com>
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
package org.communitysqueeze.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public final class Util {
	
	private final static Logger LOGGER = Logger.getLogger(Util.class);
	
	private final static DateFormat DF_FULL = 
			new SimpleDateFormat("yyyy/MM/dd HH:mm:ss z");

	public final static String LINE_SEP = 
			System.getProperty("line.separator");
	
	private final static String ALSA_DEFAULT = "default:"; 
	private final static String ALSA_SYSDEFAULT = "sysdefault:"; 
	private final static String ALSA_HW = "hw:"; 
	private final static String ALSA_PLUGHW = "plughw:"; 
	
	private final static String WALL_REBOOT_MSG = "web-gui requests reboot";
	private final static String WALL_HALT_MSG = "web-gui requests halt";
	private final static String WALL_FORCE_OPTION_MSG = " with force (" + 
			Commands.SHUTDOWN_FORCE + ") option";
	
	public final static String BLANK_STRING = "";
	
	/**
	 * 
	 */
	private Util() {
		
		super();
	}
	
	/**
	 * @param prefix
	 * @param suffix
	 * @return
	 * @throws IOException
	 */
	public final static File createTempFile(String prefix, String suffix) 
			throws IOException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("createTempFile(prefix=" + 
				prefix + ", suffix=" + suffix + ")");
		}
		
		File tmpDir = WebConfig.getTempDir();
		if (tmpDir != null) {
			return File.createTempFile(prefix, suffix, tmpDir);
		} else {
			return File.createTempFile(prefix, suffix);
		}
	}
	
	/**
	 * @return
	 */
	public final static String getModifiedFullDate() {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getModifiedFullDate()");
		}
		
		synchronized (DF_FULL) {
			return DF_FULL.format(new Date());
		}
	}
	
	/**
	 * @return
	 */
	public final static String getModifiedComment() {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getModifiedComment()");
		}
		
		return ("# Updated by Community Squeeze web-gui at " + 
					getModifiedFullDate() + LINE_SEP);
	}
	
	/**
	 * @param array
	 * @return
	 */
	public final static String arrayToString(String[] array) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("arrayToString(array=" + array + ")");
		}
		
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < array.length; i++) {
			buffer.append(array[i]);
			if (i + 1 < array.length) {
				buffer.append(" ");
			}
		}

		return buffer.toString();
	}
	
	/**
	 * @param name
	 * @param list
	 * @return
	 */
	public final static boolean contains(final String[] list, final String name) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("contains(list=" + list + 
					"], name=" + name + ")");
		}
		
		for (int j = 0; j < list.length; j++) {
			if (list[j].equals(name)) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * @param process
	 */
	public static void closeProcessStreams(Process process) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("closeProcessStreams(process=" + process + ")");
		}
		
		if (process != null) {
			/*
			 * Close the 3 streams IN/OUT/ERR that are automatically opened behind the scenes 
			 * for each Process. Otherwise, "too many files open..."
			 */
			try {
				process.getInputStream().close();
			} catch (IOException ioe) {}
			
			try {
				process.getOutputStream().close();
			} catch (IOException ioe) {}
	
			try {
				process.getErrorStream().close();			
			} catch (IOException ioe) {}
		}
	}

	/**
	 * @return
	 */
	public final static String getMounts(String regex) {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getMounts()");
		}
		
		StringBuffer buffer = new StringBuffer();
		File tmpFile = null;
		BufferedReader reader = null;
		try {
			tmpFile = Util.createTempFile("mount", ".txt");
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_MOUNT
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			String line = null;
			while ((line = reader.readLine()) != null) {
				if (line.matches(regex)) {
					buffer.append(line + LINE_SEP);
				}
			}
		} catch (Exception e) {
			LOGGER.warn("getMounts()", e);
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
			
			if (tmpFile != null) {
				try {
					tmpFile.delete();
				} catch (Exception e) {}
			}
		}
		
		return buffer.toString();
	}
	
	/**
	 * @param interfaceName
	 * @return
	 */
	public final static String getMacAddress(String interfaceName) {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getMacAddress(interfaceName=" + interfaceName + ")");
		}
		
		File tmpFile = null;
		BufferedReader reader = null;
		try {
			tmpFile = Util.createTempFile(interfaceName + "_mac_", ".txt");
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_IFCONFIG, interfaceName
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			String line = null;
			while ((line = reader.readLine()) != null) {
				if (line.matches(Validate.REGEX_MAC_ADDRESS_IN_LINE)) {
					String[] tmpList = line.split(" ");
					for (int i = 0; i < tmpList.length; i++) {
						if (tmpList[i].trim().matches(Validate.REGEX_MAC_ADDRESS)) {
							return tmpList[i].trim();
						}
					}
				}
			}
		} catch (Exception e) {
			LOGGER.warn("getMacAddress(interfaceName=" + interfaceName + ")", e);
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
			
			if (tmpFile != null) {
				try {
					tmpFile.delete();
				} catch (Exception e) {}
			}
		}
		
		return null;
	}
	
	/**
	 * @param interfaceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private static boolean scanWirelessNetworks(String interfaceName) 
			throws IOException, InterruptedException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("scanWirelessNetworks(interfaceName=" + 
					interfaceName + ")");
		}
		
		File tmpFile = null;
		BufferedReader reader = null;
		try {
			tmpFile = Util.createTempFile("wpa_cli_scan_", ".txt");
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_WPA_CLI, 
					Commands.WPA_CLI_INTERFACE_FLAG, interfaceName, Commands.WPA_CLI_SCAN
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			String line = null;
			while ((line = reader.readLine()) != null) {
				if (line.contains(Commands.WPA_CLI_SCAN_OK)) {
					return true;
				}
			}
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
			
			if (tmpFile != null) {
				try {
					tmpFile.delete();
				} catch (Exception e) {}
			}
		}
		
		return false;
	}
		
	/**
	 * @param interfaceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private static List<String> scanResultsWirelessNetworks(String interfaceName) 
			throws IOException, InterruptedException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("scanResultsWirelessNetworks(interfaceName=" + 
							interfaceName + ")");
		}
		
		List<String> networkList = new ArrayList<String>();
		
		if (scanWirelessNetworks(interfaceName)) {
			
			File tmpFile = Util.createTempFile("wpa_cli_scan_results_", ".txt");
			BufferedReader reader = null;
			try {
				Writer writer = new FileWriter(tmpFile);
	
				String[] cmdLineArgs = new String[] {
						Commands.CMD_SUDO, Commands.CMD_WPA_CLI, 
						Commands.WPA_CLI_INTERFACE_FLAG, interfaceName, Commands.WPA_CLI_SCAN_RESULTS
				};
				
				ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
				reader = new BufferedReader(new FileReader(tmpFile));
				String line = null;
				while ((line = reader.readLine()) != null) {
					if (line.matches(Validate.REGEX_MAC_ADDRESS_IN_LINE)) {
						int index = line.lastIndexOf("\t");
						if (index > -1) {
							String name = line.substring(index + 1).trim();
							if (LOGGER.isTraceEnabled()) {
								LOGGER.trace("Adding ESSID: '" + name + "' to networkList.");
							}
							networkList.add(name);
						}
					}
				}
				Collections.sort(networkList, StringIgnoreCaseComparator.COMPARATOR);
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (Exception e) {}
				}
				
				if (tmpFile != null) {
					try {
						tmpFile.delete();
					} catch (Exception e) {}
				}
			}
		}
		
		networkList.add(0, BLANK_STRING);
		
		return networkList;
	}
		
	/**
	 * @param interfaceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public static List<String> getAvailableNetworks(String interfaceName) 
			throws IOException, InterruptedException {

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getAvailableNetworks(interfaceName=" + 
							interfaceName + ")");
		}
		
		return scanResultsWirelessNetworks(interfaceName);
	}
	
	/**
	 * @param interfaceName
	 * @param tmpFile
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public static String getInterfaceStatus(String interfaceName, File tmpFile) 
			throws IOException, InterruptedException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getInterfaceStatus(interfaceName=" + 
							interfaceName + ", tmpFile=" + tmpFile + ")");
		}
		
		BufferedReader reader = null;
		try {
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_IFCONFIG, interfaceName
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			StringBuffer buffer = new StringBuffer();
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line + Util.LINE_SEP);
			}
			return buffer.toString();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
		}		
	}
	
	/**
	 * @param serviceName
	 * @param tmpFile
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public static String getServiceStatus(String serviceName, File tmpFile) 
			throws IOException, InterruptedException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getServiceStatus(serviceName=" + 
							serviceName + ", tmpFile=" + tmpFile + ")");
		}
		
		BufferedReader reader = null;
		try {
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, Commands.SYSTEMCTL_STATUS, serviceName
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			StringBuffer buffer = new StringBuffer();
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line + Util.LINE_SEP);
			}
			return buffer.toString();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
		}		
	}
	
	/**
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public static List<String> getAudioDevList() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("getAudioDevList()");
		}
		
		ArrayList<String> list = new ArrayList<String>();
		/*
		 * Add blank entry
		 */
		list.add(BLANK_STRING);

		File tmpFile = Util.createTempFile("audioDev", ".txt");
		BufferedReader reader = null;
		try {
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_APLAY, Commands.APLAY_LIST
			};

			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			/*
			 * Parse devices from "aplay -L" stdout
			 */
			String line = null;
			while ((line = reader.readLine()) != null) {
				if (!line.startsWith(" ") && !line.startsWith("\t")) {
					line = line.trim();
					if (line.startsWith(ALSA_DEFAULT)) {
						String tmpDev = line.substring(8);
						String tmpHwDev = ALSA_HW + tmpDev;
						if (!list.contains(tmpHwDev)) {
							list.add(tmpHwDev);
						}
						String tmpPlugDev = ALSA_PLUGHW + tmpDev;
						if (!list.contains(tmpPlugDev)) {
							list.add(tmpPlugDev);
						}
					} else if (line.startsWith(ALSA_SYSDEFAULT)) {
						String tmpDev = line.substring(11);
						String tmpHwDev = ALSA_HW + tmpDev;
						if (!list.contains(tmpHwDev)) {
							list.add(tmpHwDev);
						}
						String tmpPlugDev = ALSA_PLUGHW + tmpDev;
						if (!list.contains(tmpPlugDev)) {
							list.add(tmpPlugDev);
						}
					} else {
						list.add(line);
					}
				}
			}

			return list;
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (Exception e) {}
			}
			
			if (tmpFile != null) {
				try {
					tmpFile.delete();
				} catch (Exception e) {}
			}
		}		
	}

	/**
	 * @param max
	 * @return
	 */
	public final static List<String> generatePriorityList(int max) {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("generatePriorityList(max=" + max + ")");
		}
		
		ArrayList<String> list = new ArrayList<String>();
		list.add(BLANK_STRING);
		for (int i = 1; i <= max; i++) {
			list.add(String.valueOf(i));
		}
		return list;
	}
	
	/*
	public final static ArrayList<String> getTestAudioDevList() {
		
		ArrayList<String> list = new ArrayList<String>();
		list.add(BLANK_STRING);
		list.add("null");
		list.add("pulse");
		list.add("default");
		list.add("sysdefault:CARD=Intel");
		list.add("front:CARD=Intel,DEV=0");
		list.add("surround40:CARD=Intel,DEV=0");
		list.add("surround41:CARD=Intel,DEV=0");
		list.add("surround50:CARD=Intel,DEV=0");
		list.add("surround51:CARD=Intel,DEV=0");
		list.add("surround71:CARD=Intel,DEV=0");
		list.add("iec958:CARD=Intel,DEV=0");
		list.add("hdmi:CARD=HDMI,DEV=0");		
		return list;
	}
	*/	
	
	/**
	 * @param reader
	 * @param properties
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public final static void readConfigProperties(Reader reader, Map<String, String> properties) 
			throws FileNotFoundException, IOException {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("readConfigProperties(reader=" + 
							reader + ", properties=" + properties + ")");
		}
		
		BufferedReader br = null;
		try {
			br = new BufferedReader(reader);
			String line = null;
			while ((line = br.readLine()) != null) {
				// Remove any leading or trailing white space
				line = line.trim();
				if (!line.startsWith("#")) {
					if (LOGGER.isTraceEnabled()) {
						LOGGER.trace(line);
					}
					if (line.contains("=")) {
						String[] split = line.split("=");
						if (split != null && split.length == 2) {
							String name = split[0].trim();
							String value = split[1].trim();
							
							/*
							 * get rid of leading quote
							 */
							if (value.startsWith("\"") || value.startsWith("\'")) {
								value = value.substring(1);
							}
							
							/*
							 * get rid of trailing quote
							 */
							if (value.endsWith("\"") || value.endsWith("\'")) {
								value = value.substring(0, value.length() - 1);
							}
							
							properties.put(name, value);
							if (LOGGER.isTraceEnabled()) {
								LOGGER.trace("Name='" + name + "', Value='" + value + "'");
							}
						} else {
							if (LOGGER.isTraceEnabled()) {
								LOGGER.warn("Ignoring line that contains multiple '=': " + line);
							}
						}
					} else {
						if (LOGGER.isTraceEnabled()) {
							LOGGER.warn("Ignoring line that does not contain 'name=value': " + line);
						}
					}
				} else {
					if (LOGGER.isTraceEnabled()) {
						LOGGER.trace("Ignoring commented line: " + line);
					}
				}
			}
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (Exception e) {}
			}
		}
	}

	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStatusCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlStatusCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_STATUS, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStartCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlStartCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_START, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStopCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlStopCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_STOP, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlEnableCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlEnableCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_ENABLE, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlDisableCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlDisableCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_DISABLE, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlRestartCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlRestartCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_RESTART, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlCondRestartCmdLine(String serviceName) {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("getSystemctlCondRestartCmdLine(serviceName=" + serviceName + ")");
		}

		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_COND_RESTART, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static int setTimeZone(String timeZone) 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("setTimeZone(timeZone=" + timeZone + ")");
		}

		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.SCRIPT_TIMEZONE, timeZone};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
	
	/**
	 * @param message
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public final static int wall(String message) 
			throws IOException, InterruptedException {
		
		LOGGER.info("wall(message=" + message + ")");

		String[] cmdLineArgs = new String[] {
				Commands.CMD_WALL, message
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}

	/**
	 * @param force
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public final static int reboot(boolean force) 
			throws IOException, InterruptedException {
		
		LOGGER.info("reboot(force=" + force + ")");

		String msg = WALL_REBOOT_MSG;
		String[] cmdLineArgs = null;
		if (force) {
			cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.SCRIPT_REBOOT, 
					Commands.SHUTDOWN_FORCE
			};
			msg += WALL_FORCE_OPTION_MSG;
		} else {
			cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.SCRIPT_REBOOT
			};
		}
		
		try {
			wall(msg);
		} catch (Exception e) {
			LOGGER.warn("Caught exception sending wall message: '" + 
					msg + "'!", e);
		}
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}

	/**
	 * @param force
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public final static int halt(boolean force) 
			throws IOException, InterruptedException {
		
		LOGGER.info("halt(force=" + force + ")");

		String msg = WALL_HALT_MSG;
		String[] cmdLineArgs = null;
		if (force) {
			cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.SCRIPT_HALT, 
					Commands.SHUTDOWN_FORCE
			};
			msg += WALL_FORCE_OPTION_MSG;
		} else {
			cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.SCRIPT_HALT
			};
		}
		
		try {
			wall(msg);
		} catch (Exception e) {
			LOGGER.warn("Caught exception sending wall message: '" + 
					msg + "'!", e);
		}
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
}
