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
 * 注册用户：(RegisteredUser)表实体类
 *
 */
@TableName("`registered_user`")
@Data
@EqualsAndHashCode(callSuper = false)
public class RegisteredUser implements Serializable {

    // RegisteredUser编号
    @TableId(value = "registered_user_id", type = IdType.AUTO)
    private Integer registered_user_id;

    // 用户姓名
    @TableField(value = "`user_name`")
    private String user_name;
    // 用户性别
    @TableField(value = "`user_gender`")
    private String user_gender;
    // 用户年龄
    @TableField(value = "`user_age`")
    private String user_age;
    // 联系方式
    @TableField(value = "`contact_information`")
    private String contact_information;
    // 教育背景
    @TableField(value = "`educational_background`")
    private String educational_background;
    // 工作经历
    @TableField(value = "`work_experience`")
    private String work_experience;









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
