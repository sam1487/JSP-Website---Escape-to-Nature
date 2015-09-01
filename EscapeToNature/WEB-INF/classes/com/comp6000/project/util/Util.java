package com.comp6000.project.util;

import java.io.PrintWriter;
import java.io.StringWriter;

public class Util {
	public static String convertExceptionToString(Exception e) {
		String toret = "";
		toret += "<br><br>Reason: ";
		toret +="<div style=\"padding: 7px; font-family: courier;background: lightyellow; font-size: smaller; overflow: scroll\">";
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		e.printStackTrace(pw);
		
		toret += sw.toString();
		toret += "</div>";
		return toret;
	}
}
