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
public abstract class ShouldRunnable implements Runnable {
	
	protected String context = null;
	protected boolean shouldRun = true;
	protected Thread t;
	
	/**
	 * @return
	 */
	public synchronized Thread execute() {
		
		return execute(false, null, Thread.NORM_PRIORITY);
	}
	
	/**
	 * @param priority
	 * @return
	 */
	public synchronized Thread execute(int priority) {
		
		return execute(false, null, priority);
	}
	
	/**
	 * @param daemon
	 * @return
	 */
	public synchronized Thread execute(boolean daemon) {
		
		return execute(daemon, null, Thread.NORM_PRIORITY);
	}
	
	/**
	 * @param daemon
	 * @param priority
	 * @return
	 */
	public synchronized Thread execute(boolean daemon, int priority) {
		
		return execute(daemon, null, priority);
	}
	
	/**
	 * @param daemon
	 * @param context
	 * @return
	 */
	public synchronized Thread execute(boolean daemon, String context) {
		
		return execute(daemon, context, Thread.NORM_PRIORITY);
	}
	
	/**
	 * @param daemon
	 * @param context
	 * @param priority
	 * @return
	 */
	public synchronized Thread execute(boolean daemon, String context, int priority) {
		
		if (t == null) {
			this.context = context;
			t = new Thread(this);
			t.setDaemon(daemon);
			t.setName(getNextThreadName());
			t.setPriority(priority);
			t.start();
		}

		return t;
	}
	
	/**
	 * @return
	 */
	public synchronized Thread end() {
		
		shouldRun = false;
		if (t != null  && t.isAlive()) {
			t.interrupt();
		}
		return t;
	}	
	
	/**
	 * @param prefix
	 * @return
	 */
	protected abstract String getNextThreadName(String prefix);
	
	/**
	 * @return
	 */
	protected abstract String getNextThreadName();
}