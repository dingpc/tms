package com.dpc.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DailyInfoKey {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column daily_info.SHIFT
	 * @mbggenerated
	 */
	private Long shift;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column daily_info.SHIFT_DATE
	 * @mbggenerated
	 */
	private Date shiftDate;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column daily_info.SHIFT
	 * @return  the value of daily_info.SHIFT
	 * @mbggenerated
	 */
	public Long getShift() {
		return shift;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column daily_info.SHIFT
	 * @param shift  the value for daily_info.SHIFT
	 * @mbggenerated
	 */
	public void setShift(Long shift) {
		this.shift = shift;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column daily_info.SHIFT_DATE
	 * @param shiftDate  the value for daily_info.SHIFT_DATE
	 * @mbggenerated
	 */
	public void setShiftDate(Date shiftDate) {
		this.shiftDate = shiftDate;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    public Date getShiftDate() {
        return shiftDate;
    }
}