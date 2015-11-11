package com.gu.service;

import org.springframework.stereotype.Service;

import com.gu.core.service.BaseService;
import com.gu.dao.mapper.UserMapper;
import com.gu.entity.User;

@Service
public class UserService extends BaseService<UserMapper, User>{

}
