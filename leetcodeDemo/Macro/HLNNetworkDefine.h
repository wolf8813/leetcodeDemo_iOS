//
//  HLNNetworkDefine.h
//  CloudaHLN
//
//  Created by heiline on 15/9/8.
//  Copyright (c) 2015年 chenshuijin. All rights reserved.
//

#ifndef CloudaHLN_HLNHttpErrorDefine_h
#define CloudaHLN_HLNHttpErrorDefine_h

typedef void(^HttpFailure)(NSError *error);

typedef NS_ENUM(NSInteger, HLN_HTTP_TYPE) {
    HLN_HTTP_TYPE_GET,
    HLN_HTTP_TYPE_POST
};

typedef NS_ENUM(NSInteger, HLN_REQUEST_ERROR) {
    HLN_REQUEST_ERROR_PARAM_INVALID = -10000,
    HLN_REQUEST_ERROR_SERVER_RESPONSE_INVALID,
    HLN_REQUEST_ERROR_BDUSS_INVALID = 121,
    HLN_REQUEST_ERROR_USER_DETAIL_NOT_FOUND = 157114
};

#endif
