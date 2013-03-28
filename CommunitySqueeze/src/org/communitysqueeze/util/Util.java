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
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public final class Util {
	
	private final static Logger LOGGER = Logger.getLogger(Util.class);
	
	private final static DateFormat DF_FULL = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss z");

	public final static String LINE_SEP = System.getProperty("line.separator");
	
	/**
	 * 
	 */
	private Util() {
		
		super();
	}
	
	/**
	 * @return
	 */
	public final static String getModifiedFullDate() {
		
		synchronized (DF_FULL) {
			return DF_FULL.format(new Date());
		}
	}
	
	/**
	 * @return
	 */
	public final static String getModifiedComment() {
		
		return ("# Updated by Community Squeeze web-gui at " + 
					getModifiedFullDate() + LINE_SEP);
	}
	
	/**
	 * @param array
	 * @return
	 */
	public final static String arrayToString(String[] array) {
		
		String out = "";;
		for (int i = 0; i < array.length; i++) {
			out += array[i];
			if (i + 1 < array.length) {
				out +=  " ";
			}
		}
		return out;
	}
	
	/**
	 * @param name
	 * @param list
	 * @return
	 */
	public final static boolean contains(final String[] list, final String name) {
		
		for (int j = 0; j < list.length; j++) {
			if (list[j].equals(name)) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * @param p
	 */
	public static void closeProcessStreams(Process p) {
		
		if (p != null) {
			/*
			 * Close the 3 streams IN/OUT/ERR that are automatically opened behind the scenes 
			 * for each Process. Otherwise, "too many files open..."
			 */
			try {
				p.getInputStream().close();
			} catch (IOException ioe) {}
			
			try {
				p.getOutputStream().close();
			} catch (IOException ioe) {}
	
			try {
				p.getErrorStream().close();			
			} catch (IOException ioe) {}
		}
	}
	
	/**
	 * @param interfaceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private static boolean scanWirelessNetworks(String interfaceName) 
			throws IOException, InterruptedException {
		
		File tmpFile = File.createTempFile("wpa_cli_scan_", ".txt");
		BufferedReader reader = null;
		try {
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
		
		ArrayList<String> networkList = new ArrayList<String>();
		networkList.add("");
		
		if (scanWirelessNetworks(interfaceName)) {
			
			File tmpFile = File.createTempFile("wpa_cli_scan_results_", ".txt");
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
					if (line.matches("^..\\:..\\:..\\:..\\:..\\:..*")) {
						int index = line.lastIndexOf("\t");
						if (index > -1) {
							String name = line.substring(index + 1);
							networkList.add(name.trim());
						}
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
		}
		
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
		
		File tmpFile = File.createTempFile("audioDev", ".txt");
		BufferedReader reader = null;
		try {
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.CMD_APLAY, Commands.APLAY_LIST
			};

			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);
			reader = new BufferedReader(new FileReader(tmpFile));
			ArrayList<String> list = new ArrayList<String>();
			/*
			 * Add blank entry
			 */
			list.add("");
			/*
			 * Parse devices from "aplay -L" stdout
			 */
			String line = null;
			while ((line = reader.readLine()) != null) {
				if (!line.startsWith(" ") && !line.startsWith("\t")) {
					list.add(line.trim());
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
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("");
		for (int i = 1; i <= max; i++) {
			list.add(String.valueOf(i));
		}
		return list;
	}
	
	/*
	public final static ArrayList<String> getTestAudioDevList() {
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("");
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
	public final static void readConfigProperties(Reader reader, HashMap<String, String> properties) 
			throws FileNotFoundException, IOException {
		
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
	public final static String[] getSystemctlStatusCmd(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_STATUS, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStatusCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_STATUS, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStartCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_START, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlStopCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_STOP, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlEnableCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_ENABLE, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlDisableCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_DISABLE, serviceName};
	}
	
	/**
	 * @param serviceName
	 * @return
	 */
	public final static String[] getSystemctlRestartCmdLine(String serviceName) {
		
		return new String[] {Commands.CMD_SUDO, Commands.CMD_SYSTEMCTL, 
				Commands.SYSTEMCTL_RESTART, serviceName};
	}
	
	/**
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public final static int reboot() 
			throws IOException, InterruptedException {
		
		String[] cmdLineArgs = new String[] {
				//Commands.CMD_SUDO, Commands.CMD_NOHUP, Commands.CMD_REBOOT
				Commands.CMD_SUDO, Commands.SCRIPT_REBOOT
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
}
