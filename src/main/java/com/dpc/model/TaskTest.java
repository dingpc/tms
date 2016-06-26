package com.dpc.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TaskTest {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.ID
	 * @mbggenerated
	 */
	private String id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.TASK_ID
	 * @mbggenerated
	 */
	private String taskId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.TITLE
	 * @mbggenerated
	 */
	private String title;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.DETAIL
	 * @mbggenerated
	 */
	private String detail;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.GRADE
	 * @mbggenerated
	 */
	private Long grade;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.STATE
	 * @mbggenerated
	 */
	private Long state;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.IS_FIX
	 * @mbggenerated
	 */
	private Long isFix;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.CREATE_USER_ID
	 * @mbggenerated
	 */
	private String createUserId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.CREATE_USER_NAME
	 * @mbggenerated
	 */
	private String createUserName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.CREATE_TIME
	 * @mbggenerated
	 */
	private Date createTime;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column task_test.SOLVE_TIME
	 * @mbggenerated
	 */
	private Date solveTime;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.ID
	 * @return  the value of task_test.ID
	 * @mbggenerated
	 */
	public String getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.ID
	 * @param id  the value for task_test.ID
	 * @mbggenerated
	 */
	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.TASK_ID
	 * @return  the value of task_test.TASK_ID
	 * @mbggenerated
	 */
	public String getTaskId() {
		return taskId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.TASK_ID
	 * @param taskId  the value for task_test.TASK_ID
	 * @mbggenerated
	 */
	public void setTaskId(String taskId) {
		this.taskId = taskId == null ? null : taskId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.TITLE
	 * @return  the value of task_test.TITLE
	 * @mbggenerated
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.TITLE
	 * @param title  the value for task_test.TITLE
	 * @mbggenerated
	 */
	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.DETAIL
	 * @return  the value of task_test.DETAIL
	 * @mbggenerated
	 */
	public String getDetail() {
		return detail;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.DETAIL
	 * @param detail  the value for task_test.DETAIL
	 * @mbggenerated
	 */
	public void setDetail(String detail) {
		this.detail = detail == null ? null : detail.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.GRADE
	 * @return  the value of task_test.GRADE
	 * @mbggenerated
	 */
	public Long getGrade() {
		return grade;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.GRADE
	 * @param grade  the value for task_test.GRADE
	 * @mbggenerated
	 */
	public void setGrade(Long grade) {
		this.grade = grade;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.STATE
	 * @return  the value of task_test.STATE
	 * @mbggenerated
	 */
	public Long getState() {
		return state;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.STATE
	 * @param state  the value for task_test.STATE
	 * @mbggenerated
	 */
	public void setState(Long state) {
		this.state = state;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.IS_FIX
	 * @return  the value of task_test.IS_FIX
	 * @mbggenerated
	 */
	public Long getIsFix() {
		return isFix;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.IS_FIX
	 * @param isFix  the value for task_test.IS_FIX
	 * @mbggenerated
	 */
	public void setIsFix(Long isFix) {
		this.isFix = isFix;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.CREATE_USER_ID
	 * @return  the value of task_test.CREATE_USER_ID
	 * @mbggenerated
	 */
	public String getCreateUserId() {
		return createUserId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.CREATE_USER_ID
	 * @param createUserId  the value for task_test.CREATE_USER_ID
	 * @mbggenerated
	 */
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId == null ? null : createUserId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.CREATE_USER_NAME
	 * @return  the value of task_test.CREATE_USER_NAME
	 * @mbggenerated
	 */
	public String getCreateUserName() {
		return createUserName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.CREATE_USER_NAME
	 * @param createUserName  the value for task_test.CREATE_USER_NAME
	 * @mbggenerated
	 */
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName == null ? null : createUserName
				.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column task_test.CREATE_TIME
	 * @return  the value of task_test.CREATE_TIME
	 * @mbggenerated
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.CREATE_TIME
	 * @param createTime  the value for task_test.CREATE_TIME
	 * @mbggenerated
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column task_test.SOLVE_TIME
	 * @param solveTime  the value for task_test.SOLVE_TIME
	 * @mbggenerated
	 */
	public void setSolveTime(Date solveTime) {
		this.solveTime = solveTime;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getSolveTime() {
		return solveTime;
	}
}