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

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.communitysqueeze.util.ExecuteProcess;
import org.communitysqueeze.util.Util;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public abstract class SystemctlAction extends ActionSupport {

	private static final long serialVersionUID = 6135611417140890571L;
	
	private final static Logger LOGGER = Logger.getLogger(SystemctlAction.class);
	
	protected String status;
	
	/**
	 * 
	 */
	public SystemctlAction() {
		
		super();
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("SystemctlAction()");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("execute()");
		}

		return populate();
	}
		
	/**
	 * @return
	 */
	public abstract String getServiceName();
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String populate() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("populate()");
		}

		try {
			populateServiceStatus();
		} catch (Exception e) {
			LOGGER.error("Caught exception while populating " + getServiceName() + "!", e);
			throw e;
		}
 		
		return "populate";
	}	

	/**
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected void populateServiceStatus() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("populateServiceStatus()");
		}

		File outFile = null;
		try {
			String serviceName = getServiceName();
			outFile = File.createTempFile(serviceName + "_status_", ".txt");
			status = Util.getServiceStatus(serviceName, outFile);
		} finally {
			if (outFile != null) {
				try {
					outFile.delete();
				} catch (Exception e) {}
			}
		}		
		
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String stopService() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("stopService()");
		}

		try {
			stopService(getServiceName());
		} catch (Exception e) {
			LOGGER.error("Caught exception stopping " + getServiceName() + "!", e);
			throw e;
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String restartService() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("restartService()");
		}

		try {
			restartService(getServiceName());
		} catch (Exception e) {
			LOGGER.error("Caught exception restarting " + getServiceName() + "!", e);
			throw e;
		}
		
		return SUCCESS;
	}

	/**
	 * @return
	 * @throws Exception
	 */
	public String startService() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("startService()");
		}

		try {
			startService(getServiceName());
		} catch (Exception e) {
			LOGGER.error("Caught exception starting " + getServiceName() + "!", e);
			throw e;
		}
		
		return SUCCESS;
	}

	/**
	 * @return
	 * @throws Exception
	 */
	public String enableService() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("enableService()");
		}

		try {
			enableService(getServiceName());
		} catch (Exception e) {
			LOGGER.error("Caught exception enabling " + getServiceName() + "!", e);
			throw e;
		}
		
		return SUCCESS;
	}

	/**
	 * @return
	 * @throws Exception
	 */
	public String disableService() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("disableService()");
		}

		try {
			disableService(getServiceName());
		} catch (Exception e) {
			LOGGER.error("Caught exception disabling " + getServiceName() + "!", e);
			throw e;
		}
		
		return SUCCESS;
	}

	/**
	 * @param serviceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int restartService(String serviceName) 
				throws IOException, InterruptedException{
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("restartService(serviceName=" + serviceName + ")");
		}

		return ExecuteProcess.executeCommand(
				Util.getSystemctlRestartCmdLine(serviceName));
	}

	/**
	 * @param serviceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int startService(String serviceName) 
			throws IOException, InterruptedException{
	
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("startService(serviceName=" + serviceName + ")");
		}

		return ExecuteProcess.executeCommand(
				Util.getSystemctlStartCmdLine(serviceName));
	}

	/**
	 * @param serviceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int stopService(String serviceName) 
			throws IOException, InterruptedException{
	
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("stopService(serviceName=" + serviceName + ")");
		}

		return ExecuteProcess.executeCommand(
				Util.getSystemctlStopCmdLine(serviceName));
	}

	/**
	 * @param serviceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int enableService(String serviceName) 
			throws IOException, InterruptedException{
	
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("enableService(serviceName=" + serviceName + ")");
		}

		return ExecuteProcess.executeCommand(
				Util.getSystemctlEnableCmdLine(serviceName));
	}

	/**
	 * @param serviceName
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int disableService(String serviceName) 
			throws IOException, InterruptedException{
	
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("disableService(serviceName=" + serviceName + ")");
		}

		return ExecuteProcess.executeCommand(
				Util.getSystemctlDisableCmdLine(serviceName));
	}	
	
	/**
	 * @return
	 */
	public String getStatus() {
		
		return status;
	}

	/**
	 * @param status
	 */
	public void setStatus(String status) {
		
		this.status = status;
	}
}
