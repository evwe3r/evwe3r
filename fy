<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.hailei.mapper.BrandMapper">

    <resultMap id="brandResultMap" type="brand">
        <result property="brandName" column="brand_name" />
        <result property="companyName" column="company_name" />
    </resultMap>



    <delete id="deleteByIds">
        delete from tb_brand where id in
        <foreach collection="ids" item="id" separator="," open="(" close=")">
            #{id}
        </foreach>


    </delete>
    <!-- where brand_name = #{brand.brandName}-->
    <select id="selectByPageAndCondition" resultMap="brandResultMap">
        select *
        from tb_brand
        <where>
            <if test="brand.brandName != null and brand.brandName != '' ">
                and  brand_name like #{brand.brandName}
            </if>

            <if test="brand.companyName != null and brand.companyName != '' ">
                and  company_name like #{brand.companyName}
            </if>

            <if test="brand.status != null">
                and  status = #{brand.status}
            </if>

        </where>

        limit #{begin} , #{size}

    </select>
    <select id="selectTotalCountByCondition" resultType="java.lang.Integer">

        select count(*)
        from tb_brand
        <where>
            <if test="brandName != null and brandName != '' ">
                and  brand_name like #{brandName}
            </if>

            <if test="companyName != null and companyName != '' ">
                and  company_name like #{companyName}
            </if>

            <if test="status != null">
                and  status = #{status}
            </if>

        </where>

    </select>

</mapper>
