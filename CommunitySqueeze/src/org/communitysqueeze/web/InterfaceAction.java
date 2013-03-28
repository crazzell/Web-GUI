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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.log4j.Logger;
import org.communitysqueeze.util.Commands;
import org.communitysqueeze.util.ExecuteProcess;
import org.communitysqueeze.util.Util;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public abstract class InterfaceAction extends ActionSupport {
	
	private static final long serialVersionUID = -398961030369733246L;
	
	private final static Logger LOGGER = Logger.getLogger(InterfaceAction.class);
	
	private final static String NETWORK_CONFIG_PATH = "/etc/sysconfig/network-scripts/";
	private final static String IFCFG_PREFIX = "ifcfg-";
	private final static String KEYS_PREFIX = "keys-";

	private final static String INTERFACE_PATH_PREFIX = NETWORK_CONFIG_PATH + IFCFG_PREFIX;
	
	/*
	 * Ethernet
	 */
	public final static String CFG_NAME = "NAME";
	public final static String CFG_TYPE = "TYPE";
	public final static String CFG_UUID = "UUID";
	public final static String CFG_HWADDR = "HWADDR";
	public final static String CFG_IPADDR0 = "IPADDR0";
	public final static String CFG_PREFIX0 = "PREFIX0";
	public final static String CFG_GATEWAY0 = "GATEWAY0";
	public final static String CFG_DNS1 = "DNS1";
	public final static String CFG_DNS2 = "DNS2";
	public final static String CFG_DNS3 = "DNS3";
	public final static String CFG_DOMAIN = "DOMAIN";
	public final static String CFG_ONBOOT = "ONBOOT";
	public final static String CFG_ZONE = "ZONE";
	public final static String CFG_BOOTPROTO = "BOOTPROTO";
	
	public final static String CFG_TYPE_WIRELESS = "Wireless";
	public final static String CFG_BOOTPROTO_NONE = "none";
	public final static String CFG_BOOTPROTO_DHCP = "dhcp";

	/*
	 * Wireless ifcfg-<interface>
	 */
	public final static String CFG_ESSID = "ESSID";
	public final static String CFG_MODE = "MODE";
	public final static String CFG_KEY_MGMT = "KEY_MGMT";
	
	/*
	 * Wireless keys-<interface>
	 */
	public final static String CFG_WPA_PSK = "WPA_PSK";
	
	public final static String DUMMY_ESSID = "YOUR_ESSID_HERE";
	public final static String DUMMY_WPA_PSK = "YOUR_PSK_HERE";
	
	protected HashMap<String, String> interfaceProperties = new HashMap<String, String>();
	protected HashMap<String, String> keysProperties = new HashMap<String, String>();
	
	protected String name;
	protected String type;
	protected String uuid;
	protected String hwAddr;
	
	protected String ipAddr0;
	protected String prefix0;
	protected String gateway0;
	
	protected String dns1;
	protected String dns2;
	protected String dns3;
	protected String domain;

	protected String onBoot;
	protected String zone;
	protected String bootProto;

	protected String wirelessEssid;
	protected String wirelessMode;
	protected String wirelessKeyMgmt;
	protected String wirelessWpaPsk;
	
	protected List<String> networkList;
	
	protected String status;

	/**
	 * 
	 */
	public InterfaceAction() {
		
		super();
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("InterfaceAction()");
		}
	}
	
	/**
	 * @return
	 */
	public abstract String getInterfaceName();

	/**
	 * @return the networkList
	 */
	public List<String> getNetworkList() {
		
		return networkList;
	}

	/**
	 * @param networkList the networkList to set
	 */
	public void setNetworkList(List<String> networkList) {
		
		this.networkList = networkList;
	}

	/**
	 * @return the wirelessWpaPsk
	 */
	public String getWirelessWpaPsk() {
		
		return wirelessWpaPsk;
	}

	/**
	 * @param wirelessWpaPsk the wirelessWpaPsk to set
	 */
	public void setWirelessWpaPsk(String wirelessWpaPsk) {
		
		this.wirelessWpaPsk = wirelessWpaPsk;
	}

	/**
	 * @return the wirelessEssid
	 */
	public String getWirelessEssid() {
		
		return wirelessEssid;
	}

	/**
	 * @param wirelessEssid the wirelessEssid to set
	 */
	public void setWirelessEssid(String wirelessEssid) {
		
		this.wirelessEssid = wirelessEssid;
	}

	/**
	 * @return the wirelessMode
	 */
	public String getWirelessMode() {
		
		return wirelessMode;
	}

	/**
	 * @param wirelessMode the wirelessMode to set
	 */
	public void setWirelessMode(String wirelessMode) {
		
		this.wirelessMode = wirelessMode;
	}

	/**
	 * @return the wirelessKeyMgmt
	 */
	public String getWirelessKeyMgmt() {
		
		return wirelessKeyMgmt;
	}

	/**
	 * @param wirelessKeyMgmt the wirelessKeyMgmt to set
	 */
	public void setWirelessKeyMgmt(String wirelessKeyMgmt) {
		
		this.wirelessKeyMgmt = wirelessKeyMgmt;
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
	public String getType() {
		
		return type;
	}

	/**
	 * @param type
	 */
	public void setType(String type) {
		
		this.type = type;
	}

	/**
	 * @return
	 */
	public String getUuid() {
		
		return uuid;
	}

	/**
	 * @param uuid
	 */
	public void setUuid(String uuid) {
		
		this.uuid = uuid;
	}

	/**
	 * @return
	 */
	public String getHwAddr() {
		
		return hwAddr;
	}

	/**
	 * @param hwAddr
	 */
	public void setHwAddr(String hwAddr) {
		
		this.hwAddr = hwAddr;
	}

	/**
	 * @return
	 */
	public String getIpAddr0() {
		
		return ipAddr0;
	}

	/**
	 * @param ipAddr0
	 */
	public void setIpAddr0(String ipAddr0) {
		
		this.ipAddr0 = ipAddr0;
	}

	/**
	 * @return
	 */
	public String getPrefix0() {
		
		return prefix0;
	}

	/**
	 * @param prefix0
	 */
	public void setPrefix0(String prefix0) {
		
		this.prefix0 = prefix0;
	}

	/**
	 * @return
	 */
	public String getGateway0() {
		
		return gateway0;
	}

	/**
	 * @param gateway0
	 */
	public void setGateway0(String gateway0) {
		
		this.gateway0 = gateway0;
	}

	/**
	 * @return
	 */
	public String getDns1() {
		
		return dns1;
	}

	/**
	 * @param dns1
	 */
	public void setDns1(String dns1) {
		
		this.dns1 = dns1;
	}

	/**
	 * @return
	 */
	public String getDns2() {
		
		return dns2;
	}

	/**
	 * @param dns2
	 */
	public void setDns2(String dns2) {
		
		this.dns2 = dns2;
	}

	/**
	 * @return
	 */
	public String getDns3() {
		
		return dns3;
	}

	/**
	 * @param dns3
	 */
	public void setDns3(String dns3) {
		
		this.dns3 = dns3;
	}

	/**
	 * @return
	 */
	public String getDomain() {
		
		return domain;
	}

	/**
	 * @param domain
	 */
	public void setDomain(String domain) {
		
		this.domain = domain;
	}

	/**
	 * @return
	 */
	public String getOnBoot() {
		
		return onBoot;
	}

	/**
	 * @param onBoot
	 */
	public void setOnBoot(String onBoot) {
		
		this.onBoot = onBoot;
	}

	/**
	 * @return
	 */
	public String getZone() {
		
		return zone;
	}

	/**
	 * @param zone
	 */
	public void setZone(String zone) {
		
		this.zone = zone;
	}

	/**
	 * @return
	 */
	public String getBootProto() {
		
		return bootProto;
	}

	/**
	 * @param bootProto
	 */
	public void setBootProto(String bootProto) {
		
		this.bootProto = bootProto;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		
		this.status = status;
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
	 * @throws Exception
	 */
	public String populate() throws Exception {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("populate()");
		}

		try {
			populatePropertiesFromConfigFile();
			populateInterfaceStatus();
		} catch (Exception e) {
			LOGGER.warn("Caught exception populating " + getInterfaceName() + "!", e);
			throw e;
		}
		
		return "populate";
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception {		
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("save()");
		}

		File tmpInterfaceFile = null;
		File tmpKeysFile = null;
		try {
			/*
			 * populate the property map
			 */
			readInterfaceConfigProperties();
			/*
			 * overwrite with the properties set in the web-gui
			 */
			saveProperties();
			/*
			 * write the properties to a temp file
			 */
			tmpInterfaceFile = writeTempInterfaceProperties();
			/*
			 * replace the real config file with the temp file
			 */
			replaceInterfaceConfig(tmpInterfaceFile);
			
			/*
			 * write the wireless keys file
			 */
			if (type != null && type.equals(CFG_TYPE_WIRELESS)) {
				tmpKeysFile = writeTempKeysProperties();
				replaceKeysConfig(tmpKeysFile);
			}
		} catch (Exception e) {
			LOGGER.error("Caught exception saving " + getInterfaceName() + "!", e);
			throw e;
		} finally {
			if (tmpInterfaceFile != null) {
				try {
					tmpInterfaceFile.delete();
				} catch (Exception e) {}
			}
			if (tmpKeysFile != null) {
				try {
					tmpKeysFile.delete();
				} catch (Exception e) {}
			}
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String up() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("up()");
		}

		try {
			interfaceUp();
		} catch (Exception e) {
			LOGGER.warn("Caught exception bringing interface " + getInterfaceName() + " up!", e);
			throw e;
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String down() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("down()");
		}

		try {
			interfaceDown();
		} catch (Exception e) {
			LOGGER.warn("Caught exception taking interface " + getInterfaceName() + " down!", e);
			throw e;
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String downUp() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("downUp()");
		}

		try {
			interfaceDownUp();
		} catch (Exception e) {
			LOGGER.warn("Caught exception taking interface " + getInterfaceName() + 
							" down and back up again!", e);
			throw e;
		}
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 * @throws Exception
	 */
	public String reboot() throws Exception {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("reboot()");
		}

		try {
			Util.reboot();
		} catch (Exception e) {
			LOGGER.warn("Caught exception rebooting!", e);
			throw e;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 
	 */
	protected void saveProperties() {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("saveProperties()");
		}

		/*
		 * Are we a wireless interface?
		 */
		if (type != null && type.equalsIgnoreCase(CFG_TYPE_WIRELESS)) {
			if (wirelessEssid != null && wirelessEssid.trim().length() > 0) {
				interfaceProperties.put(CFG_ESSID, "\"" + wirelessEssid.trim() + "\"");
			} else {
				interfaceProperties.put(CFG_ESSID, "\"" + DUMMY_ESSID + "\"");
			}
			
			if (wirelessWpaPsk != null && wirelessWpaPsk.trim().length() > 0) {
				keysProperties.put(CFG_WPA_PSK, "\'" + wirelessWpaPsk.trim() + "\'");
			} else {
				keysProperties.put(CFG_WPA_PSK, "\'" + DUMMY_WPA_PSK + "\'");
			}
		}
		
		/*
		 * static IP
		 */
		if (ipAddr0 != null && !ipAddr0.trim().equals("") &&
				prefix0 != null && !prefix0.trim().equals("") &&
				gateway0 != null && !gateway0.trim().equals("")) {
			interfaceProperties.put(CFG_IPADDR0, ipAddr0.trim());
			interfaceProperties.put(CFG_PREFIX0, prefix0.trim());
			interfaceProperties.put(CFG_GATEWAY0, gateway0.trim());
			interfaceProperties.put(CFG_BOOTPROTO, CFG_BOOTPROTO_NONE);
		/*
		 * dynamic IP / dhcp
		 */
		} else {
			interfaceProperties.remove(CFG_IPADDR0);
			interfaceProperties.remove(CFG_PREFIX0);
			interfaceProperties.remove(CFG_GATEWAY0);
			interfaceProperties.put(CFG_BOOTPROTO, CFG_BOOTPROTO_DHCP);
		}
			
		if (dns1 != null && !dns1.trim().equals("")) {
			interfaceProperties.put(CFG_DNS1, dns1.trim());
		} else {
			interfaceProperties.remove(CFG_DNS1);
		}
	
		if (dns2 != null && !dns2.trim().equals("")) {
			interfaceProperties.put(CFG_DNS2, dns2.trim());
		} else {
			interfaceProperties.remove(CFG_DNS2);
		}
		
		if (dns3 != null && !dns3.trim().equals("")) {
			interfaceProperties.put(CFG_DNS3, dns3.trim());
		} else {
			interfaceProperties.remove(CFG_DNS3);
		}
		
		if (domain != null && !domain.trim().equals("")) {
			interfaceProperties.put(CFG_DOMAIN, domain.trim());
		} else {
			interfaceProperties.remove(CFG_DOMAIN);
		}
	}

	/**
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected void populateInterfaceStatus() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("populateInterfaceStatus()");
		}

		File outFile = null;
		try {
			String interfaceName = getInterfaceName();
			outFile = File.createTempFile(interfaceName + "_status_", ".txt");
			status = Util.getInterfaceStatus(interfaceName, outFile);
		} finally {
			if (outFile != null) {
				try {
					outFile.delete();
				} catch (Exception e) {}
			}
		}
	}
	
	/**
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	protected void populatePropertiesFromConfigFile() 
			throws IOException, FileNotFoundException, InterruptedException {

		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("populatePropertiesFromConfigFile()");
		}

		readInterfaceConfigProperties();
		
		name = interfaceProperties.get(CFG_NAME);
		type = interfaceProperties.get(CFG_TYPE);
		uuid = interfaceProperties.get(CFG_UUID);
		hwAddr = interfaceProperties.get(CFG_HWADDR);
		ipAddr0 = interfaceProperties.get(CFG_IPADDR0);
		prefix0 = interfaceProperties.get(CFG_PREFIX0);
		gateway0 = interfaceProperties.get(CFG_GATEWAY0);
		dns1 = interfaceProperties.get(CFG_DNS1);
		dns2 = interfaceProperties.get(CFG_DNS2);
		dns3 = interfaceProperties.get(CFG_DNS3);
		domain = interfaceProperties.get(CFG_DOMAIN);
		onBoot = interfaceProperties.get(CFG_ONBOOT);
		zone = interfaceProperties.get(CFG_ZONE);
		bootProto = interfaceProperties.get(CFG_BOOTPROTO);

		/*
		 * Are we a wireless interface?
		 */
		if (type != null && type.equalsIgnoreCase(CFG_TYPE_WIRELESS)) {
			wirelessEssid = interfaceProperties.get(CFG_ESSID);
			wirelessMode = interfaceProperties.get(CFG_MODE);
			wirelessKeyMgmt = interfaceProperties.get(CFG_KEY_MGMT);
			
			try {
				readKeysConfigProperties();
			} catch (FileNotFoundException fnfe) {
				/*
				 * It's OK to ignore this. keys-<interface> might not exist.
				 * We'll create it, when we save()
				 */
			}
			
			wirelessWpaPsk = keysProperties.get(CFG_WPA_PSK);
			
			/*
			 * get the available networks
			 */
			networkList = Util.getAvailableNetworks(getInterfaceName());
		}
	}	
	
	/**
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	protected void readInterfaceConfigProperties() 
			throws FileNotFoundException, IOException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("readInterfaceConfigProperties()");
		}
		
		Util.readConfigProperties(
				new FileReader(INTERFACE_PATH_PREFIX + getInterfaceName()), 
				interfaceProperties);
	}
	
	/**
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected void readKeysConfigProperties() 
			throws FileNotFoundException, IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("readKeysConfigProperties()");
		}

		File tmpFile = null;
		
		try {
			String interfaceName = getInterfaceName();
			tmpFile = File.createTempFile(KEYS_PREFIX + interfaceName + "_", ".txt");
			Writer writer = new FileWriter(tmpFile);

			String[] cmdLineArgs = new String[] {
					Commands.CMD_SUDO, Commands.SCRIPT_KEYS_READ, interfaceName
			};
			
			ExecuteProcess.executeCommand(cmdLineArgs, writer, null);

			Util.readConfigProperties(new FileReader(tmpFile), keysProperties);
		} finally {
			if (tmpFile != null) {
				try {
					tmpFile.delete();
				} catch (Exception e) {}
			}
		}
		
	}
	
	/**
	 * @return
	 * @throws IOException
	 */
	protected File writeTempKeysProperties() 
			throws IOException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("writeTempKeysProperties()");
		}

		BufferedWriter writer = null;
		try {
			String interfaceName = getInterfaceName();
			File file = File.createTempFile(KEYS_PREFIX + interfaceName + "_", ".txt");
			writer = new BufferedWriter(new FileWriter(file));
			writer.write(Util.getModifiedComment());
			Set<Entry<String, String>> set = keysProperties.entrySet();
			Iterator<Entry<String, String>> it = set.iterator();
			while (it.hasNext()) {
				Entry<String, String> entry = it.next();
				writer.write(entry.getKey() + "=" + entry.getValue() + Util.LINE_SEP);
			}
			return file;
		} finally {
			if (writer != null) {
				try {
					writer.flush();
				} catch (Exception e) {}
				
				try {
					writer.close();
				} catch (Exception e) {}
			}
		}
	}
	
	/**
	 * @return
	 * @throws IOException
	 */
	protected File writeTempInterfaceProperties() 
			throws IOException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("writeTempInterfaceProperties()");
		}

		BufferedWriter writer = null;
		try {
			File file = File.createTempFile(IFCFG_PREFIX + getInterfaceName() + "_", ".txt");
			writer = new BufferedWriter(new FileWriter(file));
			writer.write(Util.getModifiedComment());
			Set<Entry<String, String>> set = interfaceProperties.entrySet();
			Iterator<Entry<String, String>> it = set.iterator();
			while (it.hasNext()) {
				Entry<String, String> entry = it.next();
				writer.write(entry.getKey() + "=" + entry.getValue() + Util.LINE_SEP);
			}
			return file;
		} finally {
			if (writer != null) {
				try {
					writer.flush();
				} catch (Exception e) {}
				
				try {
					writer.close();
				} catch (Exception e) {}
			}
		}
	}
	
	/**
	 * @param tmpFile
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected int replaceInterfaceConfig(File tmpFile)
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("replaceInterfaceConfig(tmpFile=" + tmpFile + ")");
		}

		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.SCRIPT_INTERFACE_UPDATE, 
				tmpFile.getAbsolutePath(), getInterfaceName()
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
	
	/**
	 * @param tmpFile
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	protected int replaceKeysConfig(File tmpFile)
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("replaceKeysConfig(tmpFile=" + tmpFile + ")");
		}

		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.SCRIPT_KEYS_UPDATE, 
				tmpFile.getAbsolutePath(), getInterfaceName()
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}
	
	/**
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int[] interfaceDownUp() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("interfaceDownUp()");
		}

		return new int[] {
				interfaceDown(), 
				interfaceUp()
		};
	}
	
	/**
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int interfaceUp() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("interfaceUp()");
		}

		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.CMD_IFUP, getInterfaceName()
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}

	/**
	 * @return
	 * @throws IOException
	 * @throws InterruptedException
	 */
	private int interfaceDown() 
			throws IOException, InterruptedException {
		
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace("interfaceDown()");
		}

		String[] cmdLineArgs = new String[] {
				Commands.CMD_SUDO, Commands.CMD_IFDOWN, getInterfaceName()
		};
		
		return ExecuteProcess.executeCommand(cmdLineArgs);
	}	
}
