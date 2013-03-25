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
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception {

		return populate();
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public abstract String populate() throws Exception;
	
	/**
	 * @return
	 */
	public abstract String getServiceName();
	
	/**
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected void populateServiceStatus() 
			throws IOException, InterruptedException {
		
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
