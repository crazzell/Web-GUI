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

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class RebootAction extends ActionSupport {

	private static final long serialVersionUID = 2521215570420058372L;

	private final static Logger LOGGER = Logger.getLogger(RebootAction.class);
	
	/**
	 * 
	 */
	public RebootAction() {
		
		super();
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("RebootAction()");
		}
	}
	
	public String execute() throws Exception {
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("execute()");
		}
		
		String result = reboot();
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("execute() returns " + result);
		}
		
		return result;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	private String reboot() throws Exception {
		
		LOGGER.info("reboot()");

		try {
			Thread.sleep(1000);
			Util.reboot();
		} catch (Exception e) {
			LOGGER.warn("Caught exception rebooting device!", e);
			throw e;
		}
		
		String result = SUCCESS;
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("reboot() returns " + result);
		}
		
		return result;
	}	
}
