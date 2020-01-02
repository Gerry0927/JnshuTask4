package com.gerry.jnshu.pojo;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Table(name = "profession")
public class Profession {
    @Id
    private Integer id;

    private String img;

    @Column(name = "dev_direction")
    private String devDirection;

    @Column(name = "profession_name")
    private String professionName;

    @Column(name = "limit_con")
    private Integer limitCon;

    @Column(name = "difficulty_con")
    private Integer difficultyCon;

    @Column(name = "period_junior")
    private Integer periodJunior;

    @Column(name = "period_senior")
    private Integer periodSenior;

    @Column(name = "need_count")
    private Integer needCount;

    @Column(name = "salary_junior")
    private Long salaryJunior;

    @Column(name = "salary_senior")
    private Long salarySenior;

    @Column(name = "salary_profess")
    private Long salaryProfess;

    @Column(name = "create_at")
    private Date createAt;

    @Column(name = "update_at")
    private Date updateAt;

    private String description;


    public void setSalaryProfess(Long salaryProfess) {
        this.salaryProfess = salaryProfess;
    }

    public Long getSalaryProfess() {
        return salaryProfess;
    }

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return img
     */
    public String getImg() {
        return img;
    }

    /**
     * @param img
     */
    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    /**
     * @return dev_direction
     */
    public String getDevDirection() {
        return devDirection;
    }

    /**
     * @param devDirection
     */
    public void setDevDirection(String devDirection) {
        this.devDirection = devDirection == null ? null : devDirection.trim();
    }

    /**
     * @return profession_name
     */
    public String getProfessionName() {
        return professionName;
    }

    /**
     * @param professionName
     */
    public void setProfessionName(String professionName) {
        this.professionName = professionName == null ? null : professionName.trim();
    }

    /**
     * @return limit_con
     */
    public Integer getLimitCon() {
        return limitCon;
    }

    /**
     * @param limitCon
     */
    public void setLimitCon(Integer limitCon) {
        this.limitCon = limitCon;
    }

    /**
     * @return difficulty_con
     */
    public Integer getDifficultyCon() {
        return difficultyCon;
    }

    /**
     * @param difficultyCon
     */
    public void setDifficultyCon(Integer difficultyCon) {
        this.difficultyCon = difficultyCon;
    }

    /**
     * @return period_junior
     */
    public Integer getPeriodJunior() {
        return periodJunior;
    }

    /**
     * @param periodJunior
     */
    public void setPeriodJunior(Integer periodJunior) {
        this.periodJunior = periodJunior;
    }

    /**
     * @return period_senior
     */
    public Integer getPeriodSenior() {
        return periodSenior;
    }

    /**
     * @param periodSenior
     */
    public void setPeriodSenior(Integer periodSenior) {
        this.periodSenior = periodSenior;
    }

    /**
     * @return need_count
     */
    public Integer getNeedCount() {
        return needCount;
    }

    /**
     * @param needCount
     */
    public void setNeedCount(Integer needCount) {
        this.needCount = needCount;
    }

    /**
     * @return salary_junior
     */
    public Long getSalaryJunior() {
        return salaryJunior;
    }

    /**
     * @param salaryJunior
     */
    public void setSalaryJunior(Long salaryJunior) {
        this.salaryJunior = salaryJunior;
    }

    /**
     * @return salary_senior
     */
    public Long getSalarySenior() {
        return salarySenior;
    }

    /**
     * @param salarySenior
     */
    public void setSalarySenior(Long salarySenior) {
        this.salarySenior = salarySenior;
    }

    /**
     * @return create_at
     */
    public Date getCreateAt() {
        return createAt;
    }

    /**
     * @param createAt
     */
    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    /**
     * @return update_at
     */
    public Date getUpdateAt() {
        return updateAt;
    }

    /**
     * @param updateAt
     */
    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    /**
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @Override
    public String toString() {
        return "Profession{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", devDirection='" + devDirection + '\'' +
                ", professionName='" + professionName + '\'' +
                ", limitCon=" + limitCon +
                ", difficultyCon=" + difficultyCon +
                ", periodJunior=" + periodJunior +
                ", periodSenior=" + periodSenior +
                ", needCount=" + needCount +
                ", salaryJunior=" + salaryJunior +
                ", salarySenior=" + salarySenior +
                ", salaryProfess=" + salaryProfess +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                ", description='" + description + '\'' +
                '}';
    }
}