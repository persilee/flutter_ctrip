//
//  BDSASRParameters.h
//  BDSpeechClient
//
//  Created by baidu on 16/6/6.
//  Copyright © 2016年 baidu. All rights reserved.
//

#ifndef BDSASRParameters_h
#define BDSASRParameters_h

#import <Foundation/Foundation.h>

#pragma mark - 开发者身份验证

/*
 * BDS_ASR_API_SECRET_KEYS
 * Value explanation:   设置API_KEY and SECRET_KEY
 * Value type:          NSArray
 * Default value:       -
 */
extern NSString* BDS_ASR_API_SECRET_KEYS;


#pragma mark - 识别器参数配置

/*
 * BDS_ASR_SAMPLE_RATE
 * Value explanation:   设置录音采样率，自动模式根据当前网络情况自行调整
 * Value type:          TVoiceRecognitionRecordSampleRateFlags
 * Default value:       @(EVoiceRecognitionRecordSampleRate16K)
 */
extern NSString* BDS_ASR_SAMPLE_RATE;

/*
 * BDS_ASR_STRATEGY
 * Value explanation:   语音识别策略
 * Value type:          TBDVoiceRecognitionStrategy
 * Default value:       @(EVR_STRATEGY_ONLINE)
 */
extern NSString* BDS_ASR_STRATEGY;

/*
 * BDS_ASR_CITY_ID
 * Value explanation:   设置城市ID，仅对地图识别类型有效
 * Value type:          NSInteger
 * Default value:       @(1)（全国）
 */
extern NSString* BDS_ASR_CITY_ID;

/*
 * BDS_ASR_PROPERTY_LIST
 * Value explanation:   设置识别类型列表，输入法不可与其他类型复合
 * Value type:          NSArray[TBDVoiceRecognitionProperty]
 * Default value:       @[@(EVoiceRecognitionPropertySearch)]
 */
extern NSString* BDS_ASR_PROPERTY_LIST;

/*
 * BDS_ASR_LANGUAGE
 * Value explanation:   设置识别语言
 * Value type:          TVoiceRecognitionLanguage
 * Default value:       @(EVoiceRecognitionLanguageChinese)
 */
extern NSString* BDS_ASR_LANGUAGE;

/*
 * BDS_ASR_ENABLE_NLU
 * Value explanation:   开启语义解析，将返回包含语义的json串
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_NLU;

/*
 * BDS_ASR_DISABLE_PUNCTUATION
 * Value explanation:   关闭输出标点
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_DISABLE_PUNCTUATION;

/*
 * BDS_ASR_ENABLE_CONTACTS
 * Value explanation:   开启通讯录识别功能，将优先返回通讯录识别结果，需事先用uploader上传通讯录
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_CONTACTS;

/*
 * BDS_ASR_ENABLE_LOCAL_VAD
 * Value explanation:   是否需要对录音数据进行端点检测，如果关闭，请同时关闭服务端提前返回：BDS_ASR_ENABLE_EARLY_RETURN
 * Value type:          BOOL
 * Default value:       @(YES)
 */
extern NSString* BDS_ASR_ENABLE_LOCAL_VAD;

/*
 * BDS_ASR_ENABLE_MODEL_VAD
 * Value explanation:   是否使用modelVAD，打开需配置资源文件参数
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_MODEL_VAD;

/*
 * BDS_ASR_MODEL_VAD_DAT_FILE
 * Value explanation:   modelVAD所需资源文件
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_MODEL_VAD_DAT_FILE;

/*
 * BDS_ASR_ENABLE_EARLY_RETURN
 * Value explanation:   服务端开启提前返回，即允许服务端在未收到客户端发送的结束标志前提前结束识别过程
 * Value type:          BOOL
 * Default value:       @(YES)
 */
extern NSString* BDS_ASR_ENABLE_EARLY_RETURN;

/*
 * BDS_ASR_VAD_ENABLE_LONG_PRESS
 * Value explanation:   设置VAD模式为长按（特殊情况设置）
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_VAD_ENABLE_LONG_PRESS;

/*
 * BDS_ASR_MFE_DNN_DAT_FILE
 * Value explanation:   设置MFE模型文件
 * Value type:          string
 * Default value:       -
 */
extern NSString* BDS_ASR_MFE_DNN_DAT_FILE;

/*
 * BDS_ASR_MFE_CMVN_DAT_FILE
 * Value explanation:   设置MFE CMVN文件路径
 * Value type:          string
 * Default value:       -
 */
extern NSString* BDS_ASR_MFE_CMVN_DAT_FILE;

/*
 * BDS_ASR_MFE_MAX_WAIT_DURATION
 * Value explanation:   设置最大等待语音时间
 * Value type:          float (帧数，每帧大小为10ms）
 * Default value:       -
 */
extern NSString* BDS_ASR_MFE_MAX_WAIT_DURATION;

/*
 * BDS_ASR_MFE_MAX_SPEECH_PAUSE
 * Value explanation:   设置切分门限
 * Value type:          float (帧数，每帧大小为10ms）
 * Default value:       -
 */
extern NSString* BDS_ASR_MFE_MAX_SPEECH_PAUSE;

#pragma mark - 音频文件路径（文件识别）

/*
 * BDS_ASR_AUDIO_FILE_PATH
 * Value explanation:   设置音频文件路径（数据源）
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_AUDIO_FILE_PATH;

/*
 * BDS_ASR_AUDIO_INPUT_STREAM
 * Value explanation:   设置音频输入流（数据源）
 * Value type:          NSInputStream
 * Default value:       nil
 */
extern NSString* BDS_ASR_AUDIO_INPUT_STREAM;

/*
 * BDS_ASR_DISABLE_AUDIO_OPERATION
 * Value explanation:   Disable sdk audio operation (Set audio session disactive).
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_DISABLE_AUDIO_OPERATION;

#pragma mark - 提示音

/*
 * BDS_ASR_PLAY_TONE
 * Value explanation:   识别提示音设置，需添加相应声音文件，可替换
 * Value type:          TBDVoiceRecognitionPlayTones
 * Default value:       @(EVRPlayToneNone) （关闭提示音）
 */
extern NSString* BDS_ASR_PLAY_TONE;

#pragma mark - SDK 工作队列

/*
 * BDS_ASR_WORK_QUEUE
 * Value explanation:   指定SDK工作队列
 * Value type:          dispatch_queue_t
 * Default value:       main queue (dispatch_get_main_queue())
 * Example: dispatch_queue_create("queueLabel", DISPATCH_QUEUE_SERIAL)
 */
extern NSString* BDS_ASR_WORK_QUEUE;

#pragma mark - 日志级别

/*
 * BDS_ASR_DEBUG_LOG_LEVEL
 * Value explanation:   指定调试日志级别
 * Value type:          TBDVoiceRecognitionDebugLogLevel
 * Default value:       @(EVRDebugLogLevelOff)
 */
extern NSString* BDS_ASR_DEBUG_LOG_LEVEL;

#pragma mark - Offline Engine Verify

/*
 * BDS_ASR_OFFLINE_APP_CODE
 * Value explanation:   离线授权所需APPCODE（APPID），如使用该方式进行正式授权，请移除临时授权文件
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_OFFLINE_APP_CODE;

/*
 * BDS_ASR_OFFLINE_LICENSE_FILE_PATH
 * Value explanation:   离线授权文件路径
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_OFFLINE_LICENSE_FILE_PATH;


#pragma mark - Offline Engine KWS

/*
 * BDS_ASR_OFFLINE_ENGINE_TYPE
 * Value explanation:   离线识别引擎类型
 * Value type:          TBDVoiceRecognitionOfflineEngineType
 * Default value:       @(EVR_OFFLINE_ENGINE_GRAMMER)
 */
extern NSString* BDS_ASR_OFFLINE_ENGINE_TYPE;

/*
 * BDS_ASR_OFFLINE_ENGINE_DAT_FILE_PATH
 * Value explanation:   离线识别资源文件路径
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_OFFLINE_ENGINE_DAT_FILE_PATH;

/*
 * BDS_ASR_OFFLINE_ENGINE_GRAMMER_FILE_PATH
 * Value explanation:   离线识别语法文件路径
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_OFFLINE_ENGINE_GRAMMER_FILE_PATH;
/*
 * BDS_ASR_OFFLINE_ENGINE_GRAMMER_SLOT
 * Value explanation:   语法模式离线语法槽，使用该参数更新离线语法文件
 * Value type:          NSString (@"{\"name\":[\"张三\",\"李四\"],\"appname\":[\"手白\",\"度秘\"]}")
 * Default value:       @""
 */
extern NSString* BDS_ASR_OFFLINE_ENGINE_GRAMMER_SLOT;
/*
 * BDS_ASR_OFFLINE_ENGINE_WAKEUP_WORDS_FILE_PATH
 * Value explanation:   唤醒词文件路径，使用了唤醒并使用离线语法识别的情况下需要设置，其他情况请忽略该参数
 * Value type:          NSString
 * Default value:       @""
 */

extern NSString* BDS_ASR_OFFLINE_ENGINE_WAKEUP_WORDS_FILE_PATH;

#pragma mark - VR from Wakeup

/*
 * BDS_ASR_OFFLINE_ENGINE_TRIGGERED_WAKEUP_WORD
 * Value explanation:   当前触发唤醒词，唤醒后立即调用识别的情况下配置，其他情况请忽略该参数
 * Value type:          NSString
 * Default value:       @""
 */
extern NSString* BDS_ASR_OFFLINE_ENGINE_TRIGGERED_WAKEUP_WORD;

/*
 * BDS_ASR_NEED_CACHE_AUDIO
 * Value explanation:   唤醒后立刻进行识别需开启该参数，其他情况请忽略该参数
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_NEED_CACHE_AUDIO;

#pragma mark - 服务端配置

/*
 * BDS_ASR_PRODUCT_ID
 * Value explanation:   设置产品ID
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_PRODUCT_ID;

/*
 * BDS_ASR_FIX_APP
 * Value explanation:   请忽略该参数
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_FIX_APP;

/*
 * BDS_ASR_SERVER_URL
 * Value explanation:   设置服务器地址
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_SERVER_URL;

/*
 * BDS_ASR_BROWSER_USER_AGENT
 * Value explanation:   设置浏览器标识(Http request header)，资源返回时会根据UA适配
 * Value type:          NSString
 * Default value:       -（可通过[UIWebView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"]获取）
 */
extern NSString* BDS_ASR_BROWSER_USER_AGENT;

/*
 * BDS_ASR_LOCATION
 * Value explanation:   更新当前地理位置信息，与地理位置相关的资源会优先返回附近资源信息, 请传入通过GPS获取到的经纬度数据
 * Value type:          CLLocation
 * Default value:       -
 */
extern NSString* BDS_ASR_LOCATION;


#pragma mark - 识别器扩展配置

/*
 * BDS_ASR_PROTOCOL
 * Value explanation:   设置协议类型
 * Value type:          TBDVoiceRecognitionProtocol
 * Default value:       @(EPROTOCOL_DEFAULT)
 */
extern NSString* BDS_ASR_PROTOCOL;

/*
 * BDS_ASR_COMPRESSION_TYPE
 * Value explanation:   录音数据压缩算法
 * Value type:          TBDVoiceRecognitionAudioCompressionType
 * Default value:       @(EVR_AUDIO_COMPRESSION_BV32)
 */
extern NSString* BDS_ASR_COMPRESSION_TYPE;

/*
 * BDS_ASR_ENABLE_DRC
 * Value explanation:   是否进行车载环境下的噪声消除
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_DRC;

/*
 * BDS_ASR_PUNCTUATION_EXT_MODE
 * Value explanation:   扩展标点模式
 * Value type:          TBDVoiceRecognitionPuncMode
 * Default value:       EVR_PUNC_MODE_FULL
 */
extern NSString* BDS_ASR_PUNCTUATION_EXT_MODE;


#pragma mark - 扩展参数

/*
 * BDS_ASR_BUA
 * Value explanation:   扩展参数，浏览器标识
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_BUA;

/*
 * BDS_ASR_PAM
 * Value explanation:   扩展参数，多轮对话需要的信息
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_PAM;

/*
 * BDS_ASR_STC
 * Value explanation:   扩展参数，统计信息
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_STC;

/*
 * BDS_ASR_LTP
 * Value explanation:   扩展参数，轻应用参数（uid）
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_LTP;

/*
 * BDS_ASR_TXT
 * Value explanation:   扩展参数，上传文本，如果设置了该字段，将略过语音输入和识别阶段（暂不支持）
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_TXT;

#pragma mark - CHUNK

/*
 * BDS_ASR_CHUNK_KEY
 * Value explanation:   Chunk协议授权字段
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_CHUNK_KEY;

/*
 * BDS_ASR_CHUNK_PARAM
 * Value explanation:   Chunk协议透传字段
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_CHUNK_PARAM;

/*
 * BDS_ASR_CHUNK_ENABLE
 * Value explanation:   Chunk协议开关
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_CHUNK_ENABLE;

#pragma mark - FEEDBACK

/*
 * BDS_ASR_ENABLE_FEEDBACK
 * Value explanation:   是否开启打点反馈功能
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_FEEDBACK;

#pragma mark - LONG-SPEECH
/*
 * BDS_ASR_ENABLE_LONG_SPEECH
 * Value explanation:   是否启用长语音识别
 * Value type:          BOOL
 * Default value:       @(NO)
 */
extern NSString* BDS_ASR_ENABLE_LONG_SPEECH;

#pragma mark - Params with Command

/*
 * BDS_ASR_REALTIME_DATA
 * Value explanation:   实时透传参数，随命令同步发送
 * Value type:          NSString
 * Default value:       -
 */
extern NSString* BDS_ASR_REALTIME_DATA;

#endif /* BDSASRParameters_h */
