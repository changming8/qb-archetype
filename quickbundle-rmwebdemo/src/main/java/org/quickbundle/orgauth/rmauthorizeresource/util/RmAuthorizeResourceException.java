//代码生成时,文件路径: e:/download/QbRmWebDemo/src/main/java/orgauth/rmauthorizeresource/util/exception/RmAuthorizeResourceException.java
//代码生成时,系统时间: 2010-11-27 22:08:42
//代码生成时,操作系统用户: Administrator

/*
 * 系统名称:单表模板 --> QbRmWebDemo
 * 
 * 文件名称: org.quickbundle.orgauth.rmauthorizeresource.util.exception --> RmAuthorizeResourceException.java
 * 
 * 功能描述:
 * 
 * 版本历史: 2010-11-27 22:08:42 创建1.0.0版 (白小勇)
 *  
 */

package org.quickbundle.orgauth.rmauthorizeresource.util;

import org.quickbundle.base.exception.RmRuntimeException;

/**
 * 功能、用途、现存BUG:
 * 
 * @author 白小勇
 * @version 1.0.0
 * @see 需要参见的其它类
 * @since 1.0.0
 */

public class RmAuthorizeResourceException extends RmRuntimeException {
	/**
	 * 构造函数
	 */
	public RmAuthorizeResourceException() {
		super();
	}
    /**
     * 构造函数:
     * @param msg
     */
    public RmAuthorizeResourceException(String msg) {
        super(msg);
    }
    
    /**
     * 构造函数:
     * @param t
     */
    public RmAuthorizeResourceException(Throwable t) {
        super(t);
    }

    /**
     * 构造函数:
     * @param msg
     * @param t
     */
    public RmAuthorizeResourceException(String msg, Throwable t) {
        super(msg, t);
    }
    
	/**
     * 构造函数:
     * @param msg
     * @param t
     * @param returnObj
     */
    public RmAuthorizeResourceException(String msg, Throwable t, Object returnObj) {
        super(msg, t, returnObj);
    }
}