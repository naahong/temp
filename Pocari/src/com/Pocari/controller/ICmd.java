package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICmd {
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception;
	// �������̽��� �ٵ�{}�κ��� ����.
}