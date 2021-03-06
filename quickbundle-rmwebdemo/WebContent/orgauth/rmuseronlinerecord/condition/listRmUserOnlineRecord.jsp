<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@page import="org.quickbundle.tools.helper.RmVoHelper"%>
<%@page import="org.quickbundle.tools.helper.RmJspHelper"%>
<%@page import="org.quickbundle.project.RmGlobalReference"%>
<%@page import="org.quickbundle.base.web.page.RmPageVo"%>
<%@ page import="org.quickbundle.orgauth.rmuseronlinerecord.vo.RmUserOnlineRecordVo" %>
<%@ page import="org.quickbundle.orgauth.rmuseronlinerecord.util.IRmUserOnlineRecordConstants" %>
<%  //判断是否只读
	boolean isReadOnly = false;
	if("1".equals(request.getAttribute(IRmUserOnlineRecordConstants.REQUEST_IS_READ_ONLY))) {
		isReadOnly = true;
	}
%>
<%  //取出List
	List<RmUserOnlineRecordVo> lResult = null;  //定义结果列表的List变量
	if(request.getAttribute(IRmUserOnlineRecordConstants.REQUEST_BEANS) != null) {  //如果request中的beans不为空
		lResult = (List)request.getAttribute(IRmUserOnlineRecordConstants.REQUEST_BEANS);  //赋值给resultList
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.quickbundle.tools.helper.RmDateHelper"%><html>
<head>
<%@ include file="/jsp/include/rmGlobal.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><bean:message key="qb.web_title"/></title>
<script type="text/javascript">
	var rmActionName = "RmUserOnlineRecordConditionAction";
	var rmJspPath = "/condition";
	function findCheckbox_onClick() {  //从多选框到修改页面
		var ids = findSelections("checkbox_template","id");  //取得多选框的选择项
		if(ids == null) {  //如果ids为空
	  		alert("请选择一条记录!")
	  		return;
		}
		if(ids.length > 1) {  //如果ids有2条以上的纪录
	  		alert("只能选择一条记录!")
	  		return;
		}
		form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=find&id=" + ids;
		form.submit();
	}
	function findOne_onClick(id) {
		form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=find&id=" + id;
		form.submit();
	}
	function deleteOne_onClick(id) {
		if(confirm("是否彻底删除该数据？")) {  //如果用户在确认对话框按"确定"
			form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=deleteMulti&ids=" + id;
			form.submit();
		}
	}
	function deleteMulti_onClick(){  //从多选框物理删除多条记录
 		var ids = findSelections("checkbox_template","id");  //取得多选框的选择项
		if(ids == null)	{  //如果ids为空
			alert("请选择记录!")
			return;
		}
		if(confirm("是否彻底删除该数据？")) {  //如果用户在确认对话框按"确定"
	    	form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=deleteMulti&ids=" + ids;
	    	form.submit();
		}
	}
	function simpleQuery_onClick(){  //简单的模糊查询
    	form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=simpleQuery";
    	form.submit();
  	}
	
	function toAdd_onClick() {  //到增加记录页面
		form.action="<%=request.getContextPath()%>/orgauth/rmuseronlinerecord" + rmJspPath + "/insertRmUserOnlineRecord.jsp";
		form.submit();
	}
	function refresh_onClick() {  //刷新本页
		form.submit();
	}
	function detail_onClick(thisId) {  //实现转到详细页面
		form.id.value = thisId;  //赋值thisId给隐藏值id
		form.action="<%=request.getContextPath()%>/" + rmActionName + ".do?cmd=detail";
		form.submit();
	}
</script>
</head>
<body>
<form name="form" method="post">

<div id="div_simple" style="display:none;">
	<table class="table_query">
		<tr>
			<td width="20%">&nbsp;</td>
			<td width="35%">&nbsp;</td>
			<td width="20%">&nbsp;</td>
			<td width="25%">&nbsp;</td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("user_id")%></td>
			<td>
				<input type="text" class="text_field_reference" hiddenInputId="user_id" name="user_id_name" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("user_id")%>" value="" /><input type="hidden" name="user_id"><img class="refButtonClass" src="<%=request.getContextPath()%>/images/09.gif" onClick="javascript:getReference(new Array(form.user_id, form.user_id_name), '<%=request.getContextPath()%>/', '<%=request.getContextPath()%>/RmUserAction.do?cmd=queryReference&referenceInputType=radio');"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_time")%></td>
			<td>
				<input type="text" class="text_field_half_reference_readonly" name="login_time_from" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_time")%>"/><img class="refButtonClass" src="<%=request.getContextPath()%>/images/09.gif" onClick="javascript:getYearMonthDay(form.login_time_from,'<%=request.getContextPath()%>/');"/>&nbsp;到&nbsp;<input type="text" class="text_field_half_reference_readonly" name="login_time_to" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_time")%>"/><img class="refButtonClass" src="<%=request.getContextPath()%>/images/09.gif" onClick="javascript:getYearMonthDay(form.login_time_to,'<%=request.getContextPath()%>/');"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("cluster_node_id")%></td>
			<td>
				<input type="text" class="text_field" name="cluster_node_id" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("cluster_node_id")%>" maxLength="25"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_sign")%></td>
			<td>
				<input type="text" class="text_field" name="login_sign" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_sign")%>" maxLength="100"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_ip")%></td>
			<td>
				<input type="text" class="text_field" name="login_ip" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_ip")%>" maxLength="25"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_uuid")%></td>
			<td>
				<input type="text" class="text_field" name="login_uuid" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_uuid")%>" maxLength="25"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_time")%></td>
			<td>
				<input type="text" class="text_field_half_reference_readonly" name="logout_time_from" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_time")%>"/><img class="refButtonClass" src="<%=request.getContextPath()%>/images/09.gif" onClick="javascript:getYearMonthDay(form.logout_time_from,'<%=request.getContextPath()%>/');"/>&nbsp;到&nbsp;<input type="text" class="text_field_half_reference_readonly" name="logout_time_to" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_time")%>"/><img class="refButtonClass" src="<%=request.getContextPath()%>/images/09.gif" onClick="javascript:getYearMonthDay(form.logout_time_to,'<%=request.getContextPath()%>/');"/>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_type")%></td>
			<td>
				<%=RmJspHelper.getSelectField("logout_type", -1, RmGlobalReference.get(IRmUserOnlineRecordConstants.DICTIONARY_RM_LOGOUT_TYPE), "", "inputName='" + IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_type") + "'", true) %>
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("online_time")%></td>
			<td>
				<input type="text" class="text_field_half" name="online_time_from" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("online_time")%>" value="" columnSize="" decimalDigits="0" />&nbsp;到&nbsp;<input type="text" class="text_field_half" name="online_time_to" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("online_time")%>" value="" columnSize="" decimalDigits="0" />
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right"><%//=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("last_operation")%></td>
			<td>
				<!--<input type="text" class="text_field" name="last_operation" inputName="<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("last_operation")%>" maxLength="500"/>-->
			<input type="button" class="button_ellipse" id="button_ok" onclickto="javascript:simpleQuery_onClick()" value="查询" />
				<input type="reset" class="button_ellipse" id="button_reset" value="清空" />
				<input type="button" class="button_ellipse" id="button_moreCondition" onclick="javascript:changeSearch_onClick(this);" value="更多条件" />
			</td>
			<td align="right"></td>
			<td></td>
		</tr>
		</table>
</div>
<div id="div_advanced" style="display:none;">
	<table class="table_query">
		<tr>
			<td width="20%"></td>
			<td width="35%"></td>
			<td width="20%"></td>
			<td width="25%"></td>
		</tr>
		<!-- 将需要隐藏的查询条件剪切到这里 -->
	</table>
</div>

<table class="tableHeader">
  <tr>
    <td width="1%"><img src="<%=request.getContextPath()%>/images/bg_mcontentL.gif" /></td>
    <td class="tableHeaderMiddleTd"><b><%=IRmUserOnlineRecordConstants.TABLE_NAME_CHINESE %>列表</b></td>
    <td class="tableHeaderMiddleTd" width="60%" align="right">
    	<%if(!isReadOnly) { %>
		<!--<input type="button" class="button_ellipse" id="button_toAdd" value="新增" onClick="javascript:toAdd_onClick();" title="跳转到新增页面"/>-->
		<input type="button" class="button_ellipse" id="button_deleteMulti" value="删除" onClick="javascript:deleteMulti_onClick();" title="删除所选的记录"/>
		<!--<input type="button" class="button_ellipse" id="button_findCheckbox" value="修改" onClick="javascript:findCheckbox_onClick();" title="跳转到修改所选的某条记录"/>-->
		<%}%>
		<input type="button" class="button_ellipse" id="button_refresh" value="刷新" onClick="javascript:refresh_onClick();" title="刷新当前页面"/>
    </td>
    <td width="1%" align="right"><img src="<%=request.getContextPath()%>/images/bg_mcontentR.gif" /></td>
  </tr>
</table>

<layout:collection name="beans" id="rmBean" styleClass="listCss" width="100%" indexId="rmOrderNumber" align="center" sortAction="0">
	<layout:collectionItem width="1%" title="<input type='checkbox' pdType='control' control='checkbox_template'/>" style="text-align:center;">
		<bean:define id="rmValue" name="rmBean" property="id"/>
		<bean:define id="rmDisplayName" name="rmBean" property="id"/>
		<input type="checkbox" name="checkbox_template" value="<%=rmValue%>" displayName="<%=rmDisplayName%>"/>
	</layout:collectionItem>
	<layout:collectionItem width="3%"  title="序" style="text-align:center;">
	<%
		Integer rmOrderNumber = (Integer)pageContext.getAttribute("rmOrderNumber");
		RmPageVo pageVo = (RmPageVo)pageContext.getRequest().getAttribute(IRmUserOnlineRecordConstants.RM_PAGE_VO);
		out.print((pageVo.getCurrentPage() - 1) * pageVo.getPageSize() + rmOrderNumber.intValue() + 1);
	%>
		<bean:define id="rmValue" name="rmBean" property="id"/>
		<input type="hidden" signName="hiddenId" value="<%=rmValue%>"/>
	</layout:collectionItem>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("user_id")%>' property="user_id" sortable="true"/>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_time")%>' property="login_time" sortable="true">
		<bean:define id="rmValue" name="rmBean" property="login_time"/>
		<%=org.quickbundle.tools.helper.RmStringHelper.prt(rmValue, 19)%>
	</layout:collectionItem>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("cluster_node_id")%>' property="cluster_node_id" sortable="true"/>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_sign")%>' property="login_sign" sortable="true"/>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_ip")%>' property="login_ip" sortable="true"/>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("login_uuid")%>' property="login_uuid" sortable="true"/>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_time")%>' property="logout_time" sortable="true">
		<bean:define id="rmValue" name="rmBean" property="logout_time"/>
		<%=org.quickbundle.tools.helper.RmStringHelper.prt(rmValue, 19)%>
	</layout:collectionItem>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("logout_type")%>' property="logout_type" sortable="true">
		<bean:define id="rmValue" name="rmBean" property="logout_type"/>
		<%=RmGlobalReference.get(IRmUserOnlineRecordConstants.DICTIONARY_RM_LOGOUT_TYPE, rmValue)%>
	</layout:collectionItem>
	<layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("online_time")%>' property="online_time" sortable="true">
		<bean:define id="rmValue" name="rmBean" property="online_time"/>
		<%=rmValue != null ? RmDateHelper.parseToTimeDesciption(Long.parseLong(rmValue.toString())) : ""%>
	</layout:collectionItem>
	<%-- 
    <layout:collectionItem width="8%" title='<%=IRmUserOnlineRecordConstants.TABLE_COLUMN_CHINESE.get("last_operation")%>' property="last_operation" sortable="true"/>
	--%>
	</layout:collection>

<!-- 下边这句是翻页, 如果去掉就不带翻页了,同时注意Action中也要调整方法 -->
<jsp:include page="/jsp/include/page.jsp" />

<input type="hidden" name="id" value="">
<input type="hidden" name="queryCondition" value="">
<%=isReadOnly ? "<input type=\"hidden\" name=\"" + IRmUserOnlineRecordConstants.REQUEST_IS_READ_ONLY + "\" value=\"1\">" : ""%>

</form>
</body>
</html>
<script type="text/javascript">
<%  //表单回写
	if(request.getAttribute(IRmUserOnlineRecordConstants.REQUEST_WRITE_BACK_FORM_VALUES) != null) {  //如果request中取出的表单回写bean不为空
		out.print(RmVoHelper.writeBackMapToForm((java.util.Map)request.getAttribute(IRmUserOnlineRecordConstants.REQUEST_WRITE_BACK_FORM_VALUES)));  //输出表单回写方法的脚本
	}
%>
autoPatchParentIdName("<%=IRmUserOnlineRecordConstants.DEFAULT_CONDITION_KEY_ARRAY[0]%>");
</script>