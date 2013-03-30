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

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class EthernetSaveAction extends EthernetAction {

	private static final long serialVersionUID = 6118435658784817126L;
	
	private final static Logger LOGGER = Logger.getLogger(EthernetSaveAction.class);
	
	/**
	 * 
	 */
	public EthernetSaveAction() {
	
		super();
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("EthernetSaveAction()");
		}
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("validate()");
		}
		
		validate_();
	}
	
	/* (non-Javadoc)
	 * @see org.communitysqueeze.web.InterfaceAction#execute()
	 */
	public String execute() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("execute()");
		}
		
		return save_();
	}
}
