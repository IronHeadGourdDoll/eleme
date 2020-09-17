package com.ruoyi.framework.security;

import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;

@EnableWebSecurity
public class WebSecurity {

    /**
    * Path Variables in Web Security Expressions
    *At times it is nice to be able to refer to path variables within a URL. For example, consider a RESTful application that looks up a user by id from the URL path in the format /user/{userId}.
     *
     * You can easily refer to the path variable by placing it in the pattern. For example, if you had a Bean with the name of webSecurity that contains the following method signature:
     *
     * public class WebSecurity {
     *         public boolean checkUserId(Authentication authentication, int id) {
     *                 ...
     *         }
     * }
     *
     * http
     *     .authorizeRequests(authorize -> authorize
     *         .antMatchers("/user/{userId}/**").access("@webSecurity.checkUserId(authentication,#userId)")
     *         ...
     *     );
     * In this configuration URLs that match would pass in the path variable (and convert it) into checkUserId method. For example, if the URL were /user/123/resource, then the id passed in would be 123.
    */
    public boolean checkId(Authentication authentication, int id) {
        return true;
    }

    public boolean checkId( int id) {
        return true;
    }
}
