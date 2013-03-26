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
package org.communitysqueeze.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.communitysqueeze.util.Commands;
import org.communitysqueeze.util.ExecuteProcess;
import org.communitysqueeze.util.Util;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class SqueezeliteAction extends SystemctlAction {

	private static final long serialVersionUID = -6984779965819629682L;
	
	private final static Logger LOGGER = Logger.getLogger(SqueezeliteAction.class);

	private final static String NAME = "squeezelite";
	private final static String SERVICE_NAME = NAME + ".service";
	private final static String SQUEEZELITE_CONFIG_PATH = "/etc/sysconfig/";
	private final static String SQUEEZELITE_CONFIG_FILE_NAME = NAME;
	
	private final static String WANDBOARD_DEFAULT_AUDIO_DEVICE = "sgtl5000audio";
	
	/*
	 * Store the non commented <name>="<value>" config params in a map
	 */
	protected HashMap<String, String> properties = new HashMap<String, String>();

	private final static String CFG_NAME = "NAME";
	private final static String CFG_NAME_OPTION = "-n ";
	private final static String CFG_MAC = "MAC";
	private final static String CFG_MAC_OPTION = "-m ";
	private final static String CFG_MAX_RATE = "MAX_RATE";
	private final static String CFG_MAX_RATE_OPTION = "-r ";
	private final static String CFG_AUDIO_DEV = "AUDIO_DEV";
	private final static String CFG_AUDIO_DEV_OPTION = "-o ";
	private final static String CFG_LOG_FILE = "LOG_FILE";
	private final static String CFG_LOG_FILE_OPTION = "-f ";
	private final static String CFG_LOG_LEVEL = "LOG_LEVEL";
	private final static String CFG_LOG_LEVEL_OPTION = "-d ";
	private final static String CFG_PRIORITY = "PRIORITY";
	private final static String CFG_PRIORITY_OPTION = "-p ";
	private final static String CFG_BUFFER = "BUFFER";
	private final static String CFG_BUFFER_OPTION = "-b ";
	private final static String CFG_CODEC = "CODEC";
	private final static String CFG_CODEC_OPTION = "-c ";
	private final static String CFG_ALSA_PARAMS = "ALSA_PARAMS";
	private final static String CFG_ALSA_PARAMS_OPTION = "-a ";
	private final static String CFG_SERVER_IP = "SERVER_IP";
	
	private String name;
	private String mac;
	private String maxRate;
	private String audioDev;
	private String logFile;
	private String logLevel;
	private String priority;
	private String buffer;
	private String codec;
	private String alsaParams;
	private String serverIp;
	
	private List<String> priorityList;
	private List<String> audioDevList;
	
	/**
	 * 
	 */
	public SqueezeliteAction() {
		
		super();		
	}

	/* (non-Javadoc)
	 * @see org.communitysqueeze.web.SystemctlAction#getServiceName()
	 */
	@Override
	public String getServiceName() {
		
		return SERVICE_NAME;
	}
	
	/**
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private void populatePropertiesFromConfigFile() 
			throws IOException, FileNotFoundException {

		readSqueezeliteConfigProperties(SQUEEZELITE_CONFIG_FILE_NAME);
		
		name = properties.get(CFG_NAME);
		mac = properties.get(CFG_MAC);
		maxRate = properties.get(CFG_MAX_RATE);
		audioDev = properties.get(CFG_AUDIO_DEV);
		/*
		 * AUDIO_DEV is set in config file. 
		 * Make sure it is in the list. 
		 * Might not be if USB DAC and currently disconnected.
		 */
		if (audioDev != null) {
			if (!audioDevList.contains(audioDev)) {
				audioDevList.add(0, audioDev);
			}
		}
		logFile = properties.get(CFG_LOG_FILE);
		logLevel = properties.get(CFG_LOG_LEVEL);
		priority = properties.get(CFG_PRIORITY);
		buffer = properties.get(CFG_BUFFER);
		codec = properties.get(CFG_CODEC);
		alsaParams = properties.get(CFG_ALSA_PARAMS);
		serverIp = properties.get(CFG_SERVER_IP);
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String populate() throws Exception {
		
		try {
			/*
			 * generate priority list <= 46
			 */
			priorityList = Util.generatePriorityList(46);
			/*
			 * get the list of audio devices
			 */
			audioDevList = Util.getAudioDevList();
			/*
			 * populate the editable properties
			 */
			populatePropertiesFromConfigFile();
			/*
			 * populate the service status
			 */
			populateServiceStatus();
		} catch (Exception e) {
			LOGGER.error("Caught exception populating " + getServiceName() + "!", e);
			throw e;
		}
 		
		return "populate";
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception {
		
		ArrayList<String> list = new ArrayList<String>();
		
		/*
		 * -n <name>
		 * Set the player name
		 */
		if (name != null && name.trim().length() > 0) {
			list.add(CFG_NAME + "=\"" + CFG_NAME_OPTION + name.trim() + "\"");
		}
		
		/*
		 * -m <mac addr>
		 * Set mac address, format: ab:cd:ef:12:34:56
		 */
		if (mac != null && mac.trim().length() > 0) {
			list.add(CFG_MAC + "=\"" + CFG_MAC_OPTION + mac.trim() + "\"");
		}
		
		/*
		 * -r <rate>
		 * Max sample rate for output device, enables output device to be off 
		 * when squeezelite is started
		 */
		if (maxRate != null && maxRate.trim().length() > 0) {
			try {
				/*
				 * make sure it is a number
				 */
				Integer.parseInt(maxRate.trim());
				list.add(CFG_MAX_RATE + "=\"" + CFG_MAX_RATE_OPTION + maxRate.trim() + "\"");
			} catch (NumberFormatException nfe) {}
		}
		
		String tmpAlsaParams = "";
		/*
		 * -o <output device>
		 * Specify output device, default "default" 
		 */
		if (audioDev != null && audioDev.trim().length() > 0) {
			list.add(CFG_AUDIO_DEV + "=\"" + CFG_AUDIO_DEV_OPTION + audioDev.trim() + "\"");
			/*
			 * If the user chooses sgtl5000audio device, but doesn't set alsaParams, use these
			 */
			if (audioDev.contains(WANDBOARD_DEFAULT_AUDIO_DEVICE)) {
				tmpAlsaParams = "40::16:";
			}
		}
		
		/*
		 * -f <logfile>
		 * Write debug to logfile
		 */
		if (logFile != null && logFile.trim().length() > 0) {
			list.add(CFG_LOG_FILE + "=\"" + CFG_LOG_FILE_OPTION + logFile.trim() + "\"");
		}
		
		/*
		 * -d <log>=<level>	
		 * Set logging level, 
		 * logs: all|slimproto|stream|decode|output, 
		 * level: info|debug|sdebug
		 */
		if (logLevel != null && logLevel.trim().length() > 0) {
			/*
			 * might be multiple args, separated by spaces
			 */
			String[] levelList = logLevel.trim().split(" ");
			if (levelList.length > 0) {
				String temp = CFG_LOG_LEVEL + "=\"";
				for (int i = 0; i < levelList.length; i++) {
					temp += CFG_LOG_LEVEL_OPTION + levelList[i].trim();
					if (i + 1 < levelList.length) {
						temp += " ";
					}
				}
				temp += "\"";
				list.add(temp);
			}
		}
		
		/*
		 * -c <codec1>,<codec2>
		 * Restrict codecs those specified, otherwise loads all available codecs; 
		 * known codecs: flac,pcm,mp3,ogg,aac (mad,mpg for specific mp3 codec)
		 */
		if (codec != null && codec.trim().length() > 0) {
			list.add(CFG_CODEC + "=\"" + CFG_CODEC_OPTION + codec.trim() + "\"");
		}
		
		/*
		 * -p <priority>
		 * Set real time priority of output thread (1-99)
		 */
		if (priority != null && priority.trim().length() > 0) {
			try {
				/*
				 * make sure it is a number > 0 && <= 99
				 */
				int number = Integer.parseInt(priority.trim());
				if (number > 0 && number <= 99) {
					list.add(CFG_PRIORITY + "=\"" + CFG_PRIORITY_OPTION + priority.trim() + "\"");
				}
			} catch (NumberFormatException nfe) {}
		}
		
		/*
		 * -b <stream>:<output>
		 * Specify internal Stream and Output buffer sizes in Kbytes
		 */
		if (buffer != null && buffer.trim().length() > 0) {
			/*
			 * let's do a little validation
			 * make sure we have two integers separated by a ':'
			 */
			String[] argList = buffer.trim().split(":");
			if (argList.length == 2) {
				try {
					Integer.parseInt(argList[0]);
					Integer.parseInt(argList[1]);
					list.add(CFG_BUFFER + "=\"" + CFG_BUFFER_OPTION + buffer.trim() + "\"");
				} catch (NumberFormatException nfe) {}
			}
		}
		
		boolean setAlsaParams = false;
		/*
		 * -a <b>:<c>:<f>:<m>
		 * Specify ALSA params to open output device, 
		 * b = buffer time in ms, 
		 * c = period count, 
		 * f sample format (16|24|24_3|32), 
		 * m = use mmap (0|1)
		 */
		if (alsaParams != null && alsaParams.trim().length() > 0) {
			/*
			 * basic validation, lets make sure we have 3x ':'
			 */
			String temp = alsaParams.trim();
			int count = 0;
			for (int i = 0; i < temp.length(); i++) {
				if (temp.charAt(i) == ':') {
					count++;
				}
			}
			if (count == 3) {
				list.add(CFG_ALSA_PARAMS + "=\"" + CFG_ALSA_PARAMS_OPTION + alsaParams.trim() + "\"");
				setAlsaParams = true;
			}
		}
		if (!setAlsaParams && !tmpAlsaParams.equals("")) {
			list.add(CFG_ALSA_PARAMS + "=\"" + CFG_ALSA_PARAMS_OPTION + tmpAlsaParams + "\"");
		}
		
		if (serverIp != null && serverIp.trim().length() > 0) {
			list.add(CFG_SERVER_IP + "=\"" + serverIp.trim() + "\"");
		}
		
		File file = null;
		try {
			file = writeTempSqueezeliteProperties(SQUEEZELITE_CONFIG_FILE_NAME, list);
			replaceSqueezeliteConfig(file);
		} catch (Exception e) {
			LOGGER.error("Caught exception saving " + getServiceName() + "!", e);
			throw e;
		} finally {
			if (file != null) {
				try {
					file.delete();
				} catch (Exception e) {}
			}
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 */
	public String getName() {
		
		return name;
	}
	
	/**
	 * @param name
	 */
	public void setName(String name) {
		
		this.name = name;
	}
	
	/**
	 * @return
	 */
	public String getMac() {
		
		return mac;
	}
	
	/**
	 * @param mac
	 */
	public void setMac(String mac) {
		
		this.mac = mac;
	}
	
	/**
	 * @return
	 */
	public String getMaxRate() {
		
		return maxRate;
	}
	
	/**
	 * @param maxRate
	 */
	public void setMaxRate(String maxRate) {
		
		this.maxRate = maxRate;
	}
	
	/**
	 * @return
	 */
	public String getAudioDev() {
		
		return audioDev;
	}
	
	/**
	 * @param audioDev
	 */
	public void setAudioDev(String audioDev) {
		
		this.audioDev = audioDev;
	}
	
	/**
	 * @return
	 */
	public String getLogFile() {
		
		return logFile;
	}
	
	/**
	 * @param logFile
	 */
	public void setLogFile(String logFile) {
		
		this.logFile = logFile;
	}
	
	/**
	 * @return
	 */
	public String getLogLevel() {
		
		return logLevel;
	}
	
	/**
	 * @param logLevel
	 */
	public void setLogLevel(String logLevel) {
		
		this.logLevel = logLevel;
	}
	
	/**
	 * @return
	 */
	public String getPriority() {
		
		return priority;
	}
	
	/**
	 * @param priority
	 */
	public void setPriority(String priority) {
		
		this.priority = priority;
	}
	
	/**
	 * @return
	 */
	public String getBuffer() {
		
		return buffer;
	}
	
	/**
	 * @param buffer
	 */
	public void setBuffer(String buffer) {
		
		this.buffer = buffer;
	}
	
	/**
	 * @return
	 */
	public String getCodec() {
		
		return codec;
	}
	
	/**
	 * @param codec
	 */
	public void setCodec(String codec) {
		
		this.codec = codec;
	}
	
	/**
	 * @return
	 */
	public String getAlsaParams() {
		
		return alsaParams;
	}
	
	/**
	 * @param alsaParams
	 */
	public void setAlsaParams(String alsaParams) {
		
		this.alsaParams = alsaParams;
	}
	
	/**
	 * @return
	 */
	public String getServerIp() {
		
		return serverIp;
	}
	
	/**
	 * @param serverIp
	 */
	public void setServerIp(String serverIp) {
		
		this.serverIp = serverIp;
	}

	/**
	 * @return
	 */
	public List<String> getPriorityList() {
		
		return priorityList;
	}

	/**
	 * @param priorityList
	 */
	public void setPriorityList(List<String> priorityList) {
		
		this.priorityList = priorityList;
	}

	/**
	 * @return
	 */
	public List<String> getAudioDevList() {
		
		return audioDevList;
	}

	/**
	 * @param audioDevList
	 */
	public void setAudioDevList(List<String> audioDevList) {
		
		this.audioDevList = audioDevList;
	}
	
	/**
	 * @param tmpFile
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int replaceSqueezeliteConfig(File tmpFile)
			throws IOException, InterruptedException {
		
		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.SCRIPT_SQUEEZELITE_CONFIG_UPDATE, 
				tmpFile.getAbsolutePath()
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
	
	/**
	 * @param configName
	 * @param argList
	 * @return
	 * @throws IOException
	 */
	private File writeTempSqueezeliteProperties(String configName, ArrayList<String> argList) 
			throws IOException {
		
		BufferedWriter bw = null;
		try {
			File tempFile = File.createTempFile(NAME + "_config_", ".txt");
			bw = new BufferedWriter(new FileWriter(tempFile));
			bw.write(Util.getModifiedComment());
			Iterator<String> it = argList.iterator();
			while (it.hasNext()) {
				bw.write(it.next() + Util.LINE_SEP);
			}
			return tempFile;
		} finally {
			if (bw != null) {
				try {
					bw.flush();
				} catch (Exception e) {}
				
				try {
					bw.close();
				} catch (Exception e) {}
 			}
		}
	}
	
	/**
	 * @param configName
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	private void readSqueezeliteConfigProperties(String configName) 
			throws FileNotFoundException, IOException {
		
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(SQUEEZELITE_CONFIG_PATH + configName));
			String line = null;
			while ((line = br.readLine()) != null) {
				// Remove any leading or trailing white space
				line = line.trim();
				if (!line.startsWith("#")) {
					if (LOGGER.isTraceEnabled()) {
						LOGGER.trace(line);
					}
					int index = line.indexOf('=');
					if (index > -1) {
						/*
						 * split at the first occurance of '='
						 */
						String name = line.substring(0, index);
						/*
						 * remove the '='
						 */
						String value = line.substring(index + 1);

						/*
						 * remove the '"' at the beginning of value string
						 */
						if (value.startsWith("\"")) {
							value = value.substring(1);
						}
						/*
						 * remove the '"' at end of value string
						 */
						if (value.endsWith("\"")) {
							value = value.substring(0, value.length() - 1);
						}
						
						/*
						 * we don't use an arg flag for the serverIp
						 */
						if (name.equals(CFG_SERVER_IP)) {
							properties.put(name, value);
							if (LOGGER.isTraceEnabled()) {
								LOGGER.trace("Name='" + name + "', Value='" + value + "'");
							}
						} else {
							/*
							 * Remove the arg flag
							 */
							String[] splitOption = value.split(" ");
							if (splitOption != null && splitOption.length == 2) {
								String temp = splitOption[1].trim();
								properties.put(name, temp);
								if (LOGGER.isTraceEnabled()) {
									LOGGER.trace("Name='" + name + "', Value='" + temp + "'");
								}
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
}
