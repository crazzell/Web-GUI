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

import org.apache.log4j.Logger;
import org.communitysqueeze.util.Util;
import org.communitysqueeze.util.Validate;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class SqueezeliteSaveAction extends SqueezeliteAction {

	private static final long serialVersionUID = -6556726358112205788L;
	
	private final static Logger LOGGER = Logger.getLogger(SqueezeliteSaveAction.class);
	
	/**
	 * 
	 */
	public SqueezeliteSaveAction() {
		
		super();
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("SqueezeliteSaveAction()");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate() {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("validate()");
		}
		
		if (name != null && name.trim().length() > 0) {
			if (!name.trim().matches(Validate.REGEX_ALPHA_NUMERIC)) {
				addActionError("Invalid Name! Format is <name>, alpha/numeric");				
			}
		}
		
		if (mac != null && mac.trim().length() > 0) {
			if (!mac.trim().matches(Validate.REGEX_MAC_ADDRESS)) {
				addActionError("Invalid MAC Address! Format is <ab:cd:ef:12:34:56>");
			}
		}
		
		if (maxRate != null && maxRate.trim().length() > 0) {
			try {
				int rate = Integer.parseInt(maxRate.trim());
				if (rate > Validate.SQUEEZELITE_MAX_SAMPLE_RATE) {
					addActionError("Invalid Max Sample Rate! Format is <rate>, an integer value <= 384000");
				}
			} catch (NumberFormatException nfe) {
				addActionError("Invalid Max Sample Rate! Format is <rate>, an integer value <= 384000");
			}
		}
		
		if (logLevel != null && logLevel.trim().length() > 0) {
			
			String [] tempList = logLevel.trim().split(" ");
			for (int i = 0; i < tempList.length; i++) {
				
				String[] logLevelList = tempList[i].split("=");
				if (logLevelList.length != 2) {
					addActionError("Invalid Log Level! Format is <log>=<level> [<log>=<level> <log>=<level> ...]");
					break;
				} else {
					String type = logLevelList[0];
					String level = logLevelList[1];
					if (!validateLogName(type)) {
						addActionError("Invalid Log Level '" + type + "=" + level + 
								"'! Valid logs: " + Util.arrayToString(Validate.SQUEEZELITE_LOG_NAMES));
						break;
					}
					if (!validateLogLevel(level)) {
						addActionError("Invalid Log Level '" + type + "=" + level + 
								"'! Valid levels: " + Util.arrayToString(Validate.SQUEEZELITE_LOG_LEVELS));
						break;
					}
				}
			}
		}
		
		if (buffer != null && buffer.trim().length() > 0) {
			String[] tempList = buffer.trim().split(":");
			if (tempList.length != 2) {
				addActionError("Invalid Buffer! Format is <stream:output>, where stream and output are integers");
			} else {
				try {
					Integer.parseInt(tempList[0]);
					Integer.parseInt(tempList[1]);
				} catch (NumberFormatException nfe) {
					addActionError("Invalid Buffer! Format is <stream:output>, where stream and output are integers");
				}
			}
		}
		
		if (codec != null && codec.trim().length() > 0) {
			String[] tempList = codec.trim().split(",");
			for (int i = 0; i < tempList.length; i++) {
				if (!validateCodec(tempList[i])) {
					addActionError("Invalid Codec '" + tempList[i] + 
							"'! Valid codecs: " + Util.arrayToString(Validate.SQUEEZELITE_CODECS));
					break;
				}
			}
		}
		
		if (alsaParams != null && alsaParams.trim().length() > 0) {
			if (!alsaParams.trim().matches(Validate.SQUEEZELITE_REGEX_ALSA_PARAMS)) {
				addActionError("Invalid Alsa Params! Format is <buffer>:<period count>:<format>:<mmap>, " + 
								"where buffer and period count are integers if set, " + 
								"format values: 16, 24, 24_3, 32, or not set, " + 
								"mmap values: 0, 1 or not set");		
			}
		}
		
		if (serverIp != null && serverIp.trim().length() > 0) {
			if (!serverIp.trim().matches(Validate.REGEX_IP_ADDRESS)) {
				addActionError("Invalid Server IP Address! Format is dotted quad. eg. 192.168.0.1");
			}
		}
	}
	
	/* (non-Javadoc)
	 * @see org.communitysqueeze.web.SystemctlAction#execute()
	 */
	public String execute() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("execute()");
		}
		
		Thread.sleep(5000);
		String result = save();
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("execute() returns " + result);
		}
		return result;
	}
	
	/**
	 * @param name
	 * @return
	 */
	private final static boolean validateLogName(final String name) {
		
		return Util.contains(Validate.SQUEEZELITE_LOG_NAMES, name);
	}

	/**
	 * @param level
	 * @return
	 */
	private final static boolean validateLogLevel(final String level) {
		
		return Util.contains(Validate.SQUEEZELITE_LOG_LEVELS, level);
	}
	
	/**
	 * @param codec
	 * @return
	 */
	private final static boolean validateCodec(final String codec) {
		
		return Util.contains(Validate.SQUEEZELITE_CODECS, codec);
	}
}
