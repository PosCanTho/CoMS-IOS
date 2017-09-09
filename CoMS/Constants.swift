//
//  Constants.swift
//  CoMS
//
//  Created by Pham Van Thien on 9/7/17.
//  Copyright © 2017 Pham Van Thien. All rights reserved.
//

import Foundation
struct Constants {
    /*Config*/
    public static let IS_DEBUG: Bool = true
    private static let URL_SERVER: String = "http://192.168.1.15:8888/api/"
    
    /*End config*/
    public static let ERROR_CODE = "errorCode"
    public static let MESSAGE = "message"
    public static let DOWNLOAD_ERROR = "DOWNLOAD_ERROR"
    public static let DOWNLOAD_RESPONSE = "DOWNLOAD_RESPONSE"
    
    /*Error code*/
    public static let ERROR_CODE_SUCCESS = 0
    public static let ERROR_CODE_ERROR = 1
    
    
    /*URL STRING*/
    public static let API_LOGIN = URL_SERVER + "Login";
    public static let API_REGISTER = URL_SERVER + "Register";
    public static let API_LIS_BOOKMARK = URL_SERVER + "ListBookmark";
    public static let API_GET_PROFILE = URL_SERVER + "GetProfile";
    public static let API_ADD_BOOKMARK = URL_SERVER + "AddBookmark";
    public static let API_DELETE_BOOKMARK = URL_SERVER + "DeleteBookmark";
    public static let API_GET_LIST_ACCOUNT = URL_SERVER + "ListAccount";
    public static let API_SEND_MESSAGE = URL_SERVER + "SendMessage";
    public static let API_LIST_MESSAGE = URL_SERVER + "ListMessage";
    public static let API_DELETE_ALL_MESSAGE = URL_SERVER + "DeleteAllMessage";
    public static let API_LIST_CONVERSATION = URL_SERVER + "ListConversation";
    public static let API_LIST_PACKAGE = URL_SERVER + "ListPackage";
    public static let API_GET_TOKEN = URL_SERVER + "token";
    public static let API_GET_MY_PROFILE = URL_SERVER + "MyProfile";
    public static let API_EDIT_PROFILE = URL_SERVER + "EditProfile";
    public static let API_FORGOT_PASSWORD = URL_SERVER + "ForgotPassword";
    public static let API_CHANGE_PASSWORD = URL_SERVER + "ChangePassword";
    public static let API_LIST_CONFERENCE_MAP = URL_SERVER + "ListConferenceMap";
    public static let API_LIST_CONFERENCE_LOCATION = URL_SERVER + "ListConferenceLocation";
    public static let API_LIST_NOTIFICATION = URL_SERVER + "ListNotification";
    public static let API_UPDATE_READED = URL_SERVER + "UpdateReaded";
    public static let API_DELETE_NOTIFICATION = URL_SERVER + "DeleteNotification";
    public static let API_ADD_TOKEN = URL_SERVER + "AddDevice";
    public static let API_LIST_CONFERENCE = URL_SERVER + "ListConference";
    public static let API_LIST_CONFERENCE_SESSION = URL_SERVER + "ListConferenceSession";
    public static let API_LIST_PRESENTATION_SLOT = URL_SERVER + "ListConferenceSessionPaperPresentationSlot";
    public static let API_LIST_ATTENDEE = URL_SERVER + "ListAttendee";
    public static let API_LIST_PAPER = URL_SERVER + "ListPaperText";
    public static let API_LIST_ABSTRACT = URL_SERVER + "ListPaperAbastract";
    public static let API_ORGANIZATION = URL_SERVER + "ListOrganization";
    public static let API_LIST_SCHEDULE = URL_SERVER + "ListSchedule";
}
