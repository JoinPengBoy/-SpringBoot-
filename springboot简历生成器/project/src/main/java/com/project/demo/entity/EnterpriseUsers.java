package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 企业用户：(EnterpriseUsers)表实体类
 *
 */
@TableName("`enterprise_users`")
@Data
@EqualsAndHashCode(callSuper = false)
public class EnterpriseUsers implements Serializable {

    // EnterpriseUsers编号
    @TableId(value = "enterprise_users_id", type = IdType.AUTO)
    private Integer enterprise_users_id;

    // 企业名称
    @TableField(value = "`enterprise_name`")
    private String enterprise_name;
    // 注册资本
    @TableField(value = "`registered_capital`")
    private String registered_capital;
    // 企业位置
    @TableField(value = "`enterprise_location`")
    private String enterprise_location;
    // 营业执照
    @TableField(value = "`business_license`")
    private String business_license;





    // 审核状态
    @TableField(value = "examine_state")
    private String examine_state;



    // 审核回复
    @TableField(value = "examine_reply")
    private String examine_reply;

    // 用户编号
    @TableField(value = "user_id")
    private Integer userId;











		


	// 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

}
