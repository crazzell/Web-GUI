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

import org.apache.log4j.Logger;

/**
 * @author Clive Messer <clive.m.messer@gmail.com>
 *
 */
public class FstabEntry {
	
	private static final Logger LOGGER = Logger.getLogger(FstabEntry.class);
	
	private String spec = null;
	private String file = null;
	private String vfsType = null;
	private String mntOps = null;
	private int freq = 0;
	private int passNo = 0;
	
	/**
	 * 
	 */
	public FstabEntry() {
		
		super();
		
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("FstabEntry()");
		}
	}

	/**
	 * @return the spec
	 */
	public String getSpec() {
		return spec;
	}

	/**
	 * @param spec the spec to set
	 */
	public void setSpec(String spec) {
		this.spec = spec;
	}

	/**
	 * @return the file
	 */
	public String getFile() {
		return file;
	}

	/**
	 * @param file the file to set
	 */
	public void setFile(String file) {
		this.file = file;
	}

	/**
	 * @return the vfsType
	 */
	public String getVfsType() {
		return vfsType;
	}

	/**
	 * @param vfsType the vfsType to set
	 */
	public void setVfsType(String vfsType) {
		this.vfsType = vfsType;
	}

	/**
	 * @return the mntOps
	 */
	public String getMntOps() {
		return mntOps;
	}

	/**
	 * @param mntOps the mntOps to set
	 */
	public void setMntOps(String mntOps) {
		this.mntOps = mntOps;
	}

	/**
	 * @return the freq
	 */
	public int getFreq() {
		return freq;
	}

	/**
	 * @param freq the freq to set
	 */
	public void setFreq(int freq) {
		this.freq = freq;
	}

	/**
	 * @return the passNo
	 */
	public int getPassNo() {
		return passNo;
	}

	/**
	 * @param passNo the passNo to set
	 */
	public void setPassNo(int passNo) {
		this.passNo = passNo;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("FstabEntry(");
		buffer.append("spec=");
		buffer.append(spec);
		buffer.append(", file=");
		buffer.append(file);
		buffer.append(", vfsType=");
		buffer.append(vfsType);
		buffer.append(", mntOps=");
		buffer.append(mntOps);
		buffer.append(", freq=");
		buffer.append(freq);
		buffer.append(", passNo=");
		buffer.append(passNo);
		buffer.append(")");
		
		return buffer.toString();
	}
}
