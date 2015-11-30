package com.gu.util;

import java.awt.image.BufferedImage;

import jp.sourceforge.qrcode.data.QRCodeImage;

/**
 * 二维码
 * 创建人：YH 创建时间：2015年4月10日
 * @version
 */
public class TwoDimensionCodeImage implements QRCodeImage {

	BufferedImage bufImg;

	public TwoDimensionCodeImage(BufferedImage bufImg) {
		this.bufImg = bufImg;
	}

	public int getHeight() {
		return bufImg.getHeight();
	}

	public int getPixel(int x, int y) {
		return bufImg.getRGB(x, y);
	}

	public int getWidth() {
		return bufImg.getWidth();
	}

}
