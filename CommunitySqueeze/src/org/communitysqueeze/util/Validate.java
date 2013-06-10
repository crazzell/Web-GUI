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

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class Validate {

	public final static String REGEX_IP_ADDRESS = 
		"^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$";
	
	public final static String REGEX_HOST_ADDRESS = 
		"^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\-]*[a-zA-Z0-9])\\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\\-]*[A-Za-z0-9])$";
	
	public final static String REGEX_MAC_ADDRESS = 
		"^[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}$";
	
	public final static String REGEX_MAC_ADDRESS_IN_LINE = 
			".*[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}.*";

	public final static int MAC_STRING_LENGTH = 17;
	
	public final static String REGEX_ALPHA_NUMERIC = "^[a-zA-Z0-9]*$";
	
	public final static String REGEX_ALPHA_NUMERIC_UNDERSCORE = "^[a-zA-Z0-9_]*$";

	public final static String SQUEEZELITE_REGEX_ALSA_PARAMS = "^([0-9]*):([0-9]*):(16|24|24_3|32)?:(0|1)?$";

	public final static String SQUEEZELITE_REGEX_ALSA_BUFFER = "^([0-9]*):([0-9]*)$";

	public final static int SQUEEZELITE_MAX_SAMPLE_RATE = 384000;
	
	public final static String[] SQUEEZELITE_LOG_NAMES = {"all", "slimproto", "stream", "decode", "output"};
	
	public final static String[] SQUEEZELITE_LOG_LEVELS = {"info", "debug", "sdebug"};
	
	public final static String[] SQUEEZELITE_CODECS = {"flac", "pcm", "mp3", "ogg", "aac", "mad", "mpg"};
	
	/**
	 * 
	 */
	private Validate() {
		
		super();
	}
}
