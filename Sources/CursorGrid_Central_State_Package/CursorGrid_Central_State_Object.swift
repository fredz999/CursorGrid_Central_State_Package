//
//  CursorGrid_Central_State_Object.swift
//  
//
//  Created by Jon on 11/07/2022.
//

import Foundation
import SwiftUI
import Combine

public class CursorGrid_Central_State : ObservableObject{
    
    @Published public var shared_Cursor_X_Int : Int = 0
    @Published public var shared_Cursor_Y_Int : Int = 0
    
    @Published public var shared_Cursor_DataX_Int : Int = 0
    @Published public var shared_Cursor_DataY_Int : Int = 0

    public var shared_Cursor_YData_Lowest : Int = 0

    public init(){}
    
    public func change_Shared_Cursor_YData_Lowest(newLowestY:Int){
        shared_Cursor_YData_Lowest = newLowestY
    }

    public var cursorLayer_X_Update : ((Int)->())?
    //public var potentialLayer_X_Update : ( (Int,Int,Int,Int)->())?
    
    public var cursor_Y_Func_1 : ((Int)->())?
    public var cursor_Y_Func_2 : ((Int)->())?
    //public var cursor_Y_Func_3 : ((Int,Int,Int,Int)->())?
    
    //=======================================================================================================================
    public func incoming_Cursor_X_Int_Update(new_Cursor_X_Int: Int) {
        set_Shared_CursorX_Int(new_Cursor_X_Int: new_Cursor_X_Int)
        if let lclsingleInt_Func_2 = cursorLayer_X_Update {
            lclsingleInt_Func_2(shared_Cursor_X_Int)
        }

        if let lclPosUpdate = updateVisualPosition {
            lclPosUpdate(new_Cursor_X_Int,shared_Cursor_Y_Int)
        }
    }
    
    public func set_Shared_CursorX_Int(new_Cursor_X_Int: Int){
        shared_Cursor_X_Int = new_Cursor_X_Int
        shared_Cursor_DataX_Int = shared_Cursor_X_Int
    }
    //=======================================================================================================================
    public func incoming_Cursor_Y_Int_Update(new_Cursor_Y_Int: Int) {
        set_Shared_CursorY_Int(new_Cursor_Y_Int: new_Cursor_Y_Int)
        if let lclsingleInt_Func_2 = cursor_Y_Func_2 {
            lclsingleInt_Func_2(shared_Cursor_Y_Int)
        }
        if let lclPosUpdate = updateVisualPosition {
            lclPosUpdate(shared_Cursor_X_Int,new_Cursor_Y_Int)
        }
    }
    
    public func set_Shared_CursorY_Int(new_Cursor_Y_Int: Int){
        shared_Cursor_Y_Int = new_Cursor_Y_Int
        set_Shared_CursorY_Data_Int()
    }
    
    public func set_Shared_CursorY_Data_Int(){
        shared_Cursor_DataY_Int = shared_Cursor_Y_Int + shared_Cursor_YData_Lowest
    }
    //=======================================================================================================================
    
    
    
    public var noteWriteON_ParamSourceFunc : (()->(Int,Int,Int,Int))?
    //public var noteWriteON_EndpointFunc : ((Int,Int,Int,Int)->())?
    public var noteWriteOFF_EndpointFunc : (()->())?
    
    public var update_Lower_Data_Y_Endpoint_1 : ((Int)->())?
    public var update_Lower_Data_Y_Endpoint_twoo : ((Int)->())?
    public var update_Lower_Data_Y_Endpoint_three : (()->())?
    public var update_Lower_Data_Y_Endpoint_4 : ((Int)->())?
    public var retrieve_LowerY_Param_From_VSlider_Responder : (()->(Int))?
    
    public func trigger_Data_Update(){
    
        if let lclInternalFunc = retrieve_LowerY_Param_From_VSlider_Responder {
            let intParam = lclInternalFunc()
            
            if let lclTargetFunc = update_Lower_Data_Y_Endpoint_1 {
                lclTargetFunc(intParam)
            }
            
            if let lclTargetFunc2 = update_Lower_Data_Y_Endpoint_twoo {
                lclTargetFunc2(intParam)
            }
            
            if let lclTargetFunc3 = update_Lower_Data_Y_Endpoint_three {
                lclTargetFunc3()
            }
            
            if let lclTargetFunc4 = update_Lower_Data_Y_Endpoint_4 {
                lclTargetFunc4(intParam)
            }
            
        }
    }
    
    public func returnFourCursorThings()->(Int,Int,Int,Int){
        let retval : (Int,Int,Int,Int) = (shared_Cursor_X_Int,shared_Cursor_Y_Int,shared_Cursor_DataX_Int,shared_Cursor_DataY_Int)
        return retval
    }
    
    public var updateVisualPosition : ((Int,Int)->())?

}
