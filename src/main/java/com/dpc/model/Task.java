package com.dpc.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Task {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.ID
	 * @mbggenerated
	 */
	private String id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.MODULE
	 * @mbggenerated
	 */
	private Long module;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.TITLE
	 * @mbggenerated
	 */
	private String title;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.DETAIL
	 * @mbggenerated
	 */
	private String detail;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.GRADE
	 * @mbggenerated
	 */
	private Long grade;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.LEADER_ID
	 * @mbggenerated
	 */
	private String leaderId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.LEADER_NAME
	 * @mbggenerated
	 */
	private String leaderName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.MEMBER_ID
	 * @mbggenerated
	 */
	private String memberId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.MEMBER_NAME
	 * @mbggenerated
	 */
	private String memberName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.PARENT_ID
	 * @mbggenerated
	 */
	private String parentId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.APPLY_DEPT
	 * @mbggenerated
	 */
	private String applyDept;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.APPLY_USER_NAME
	 * @mbggenerated
	 */
	private String applyUserName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.START_TIME
	 * @mbggenerated
	 */
	private Date startTime;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.END_TIME
	 * @mbggenerated
	 */
	private Date endTime;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.PROGRESS
	 * @mbggenerated
	 */
	private Long progress;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.OVERDUE_DAY
	 * @mbggenerated
	 */
	private Long overdueDay;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.OVERDUE_REASON
	 * @mbggenerated
	 */
	private String overdueReason;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.IS_COMPLETE
	 * @mbggenerated
	 */
	private Long isComplete;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.COMPLETE_TIME
	 * @mbggenerated
	 */
	private Date completeTime;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.CREATE_USER_ID
	 * @mbggenerated
	 */
	private String createUserId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task.CREATE_TIME
	 * @mbggenerated
	 */
	private Date createTime;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.ID
	 * @return  the value of task.ID
	 * @mbggenerated
	 */
	public String getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.ID
	 * @param id  the value for task.ID
	 * @mbggenerated
	 */
	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.MODULE
	 * @return  the value of task.MODULE
	 * @mbggenerated
	 */
	public Long getModule() {
		return module;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.MODULE
	 * @param module  the value for task.MODULE
	 * @mbggenerated
	 */
	public void setModule(Long module) {
		this.module = module;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.TITLE
	 * @return  the value of task.TITLE
	 * @mbggenerated
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.TITLE
	 * @param title  the value for task.TITLE
	 * @mbggenerated
	 */
	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.DETAIL
	 * @return  the value of task.DETAIL
	 * @mbggenerated
	 */
	public String getDetail() {
		return detail;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.DETAIL
	 * @param detail  the value for task.DETAIL
	 * @mbggenerated
	 */
	public void setDetail(String detail) {
		this.detail = detail == null ? null : detail.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.GRADE
	 * @return  the value of task.GRADE
	 * @mbggenerated
	 */
	public Long getGrade() {
		return grade;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.GRADE
	 * @param grade  the value for task.GRADE
	 * @mbggenerated
	 */
	public void setGrade(Long grade) {
		this.grade = grade;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.LEADER_ID
	 * @return  the value of task.LEADER_ID
	 * @mbggenerated
	 */
	public String getLeaderId() {
		return leaderId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.LEADER_ID
	 * @param leaderId  the value for task.LEADER_ID
	 * @mbggenerated
	 */
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId == null ? null : leaderId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.LEADER_NAME
	 * @return  the value of task.LEADER_NAME
	 * @mbggenerated
	 */
	public String getLeaderName() {
		return leaderName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.LEADER_NAME
	 * @param leaderName  the value for task.LEADER_NAME
	 * @mbggenerated
	 */
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName == null ? null : leaderName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.MEMBER_ID
	 * @return  the value of task.MEMBER_ID
	 * @mbggenerated
	 */
	public String getMemberId() {
		return memberId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.MEMBER_ID
	 * @param memberId  the value for task.MEMBER_ID
	 * @mbggenerated
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId == null ? null : memberId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.MEMBER_NAME
	 * @return  the value of task.MEMBER_NAME
	 * @mbggenerated
	 */
	public String getMemberName() {
		return memberName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.MEMBER_NAME
	 * @param memberName  the value for task.MEMBER_NAME
	 * @mbggenerated
	 */
	public void setMemberName(String memberName) {
		this.memberName = memberName == null ? null : memberName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.PARENT_ID
	 * @return  the value of task.PARENT_ID
	 * @mbggenerated
	 */
	public String getParentId() {
		return parentId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.PARENT_ID
	 * @param parentId  the value for task.PARENT_ID
	 * @mbggenerated
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId == null ? null : parentId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.APPLY_DEPT
	 * @return  the value of task.APPLY_DEPT
	 * @mbggenerated
	 */
	public String getApplyDept() {
		return applyDept;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.APPLY_DEPT
	 * @param applyDept  the value for task.APPLY_DEPT
	 * @mbggenerated
	 */
	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept == null ? null : applyDept.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.APPLY_USER_NAME
	 * @return  the value of task.APPLY_USER_NAME
	 * @mbggenerated
	 */
	public String getApplyUserName() {
		return applyUserName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.APPLY_USER_NAME
	 * @param applyUserName  the value for task.APPLY_USER_NAME
	 * @mbggenerated
	 */
	public void setApplyUserName(String applyUserName) {
		this.applyUserName = applyUserName == null ? null : applyUserName
				.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.START_TIME
	 * @param startTime  the value for task.START_TIME
	 * @mbggenerated
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.END_TIME
	 * @param endTime  the value for task.END_TIME
	 * @mbggenerated
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.PROGRESS
	 * @return  the value of task.PROGRESS
	 * @mbggenerated
	 */
	public Long getProgress() {
		return progress;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.PROGRESS
	 * @param progress  the value for task.PROGRESS
	 * @mbggenerated
	 */
	public void setProgress(Long progress) {
		this.progress = progress;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.OVERDUE_DAY
	 * @return  the value of task.OVERDUE_DAY
	 * @mbggenerated
	 */
	public Long getOverdueDay() {
		return overdueDay;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.OVERDUE_DAY
	 * @param overdueDay  the value for task.OVERDUE_DAY
	 * @mbggenerated
	 */
	public void setOverdueDay(Long overdueDay) {
		this.overdueDay = overdueDay;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.OVERDUE_REASON
	 * @return  the value of task.OVERDUE_REASON
	 * @mbggenerated
	 */
	public String getOverdueReason() {
		return overdueReason;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.OVERDUE_REASON
	 * @param overdueReason  the value for task.OVERDUE_REASON
	 * @mbggenerated
	 */
	public void setOverdueReason(String overdueReason) {
		this.overdueReason = overdueReason == null ? null : overdueReason
				.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.IS_COMPLETE
	 * @return  the value of task.IS_COMPLETE
	 * @mbggenerated
	 */
	public Long getIsComplete() {
		return isComplete;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.IS_COMPLETE
	 * @param isComplete  the value for task.IS_COMPLETE
	 * @mbggenerated
	 */
	public void setIsComplete(Long isComplete) {
		this.isComplete = isComplete;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.COMPLETE_TIME
	 * @param completeTime  the value for task.COMPLETE_TIME
	 * @mbggenerated
	 */
	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.CREATE_USER_ID
	 * @return  the value of task.CREATE_USER_ID
	 * @mbggenerated
	 */
	public String getCreateUserId() {
		return createUserId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.CREATE_USER_ID
	 * @param createUserId  the value for task.CREATE_USER_ID
	 * @mbggenerated
	 */
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId == null ? null : createUserId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task.CREATE_TIME
	 * @return  the value of task.CREATE_TIME
	 * @mbggenerated
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task.CREATE_TIME
	 * @param createTime  the value for task.CREATE_TIME
	 * @mbggenerated
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getStartTime() {
		return startTime;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getCompleteTime() {
		return completeTime;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getEndTime() {
		return endTime;
	}
}