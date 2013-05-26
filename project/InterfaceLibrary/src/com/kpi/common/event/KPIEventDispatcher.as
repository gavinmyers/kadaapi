package com.kpi.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class KPIEventDispatcher
	{
      private static var instance : KPIEventDispatcher;  
      private var eventDispatcher : CairngormEventDispatcher;
      
      /**
       * Returns the single instance of the dispatcher
       */ 
      public static function getInstance() : KPIEventDispatcher 
      {
         if ( instance == null ) {
            instance = new KPIEventDispatcher();
            instance.eventDispatcher = CairngormEventDispatcher.getInstance();
         }
           return instance;
      }
      
      /**
       * Constructor.
       */
      public function KPIEventDispatcher( target:IEventDispatcher = null ) 
      {
         eventDispatcher = new CairngormEventDispatcher();
      }
      
      /**
       * Adds an event listener.
       */
      public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ) : void 
      {
      	trace("adding event listener " + type);
         eventDispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
      }
      
      /**
       * Removes an event listener.
       */
      public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ) : void 
      {
         eventDispatcher.removeEventListener( type, listener, useCapture );
      }

      /**
       * Dispatches a cairngorm event.
       */
      public function dispatchEvent( event:CairngormEvent ) : Boolean 
      {
      	trace("dispatching event " + event.type);
         return eventDispatcher.dispatchEvent( event );
      }
      
      /**
       * Returns whether an event listener exists.
       */
      public function hasEventListener( type:String ) : Boolean 
      {
         return eventDispatcher.hasEventListener( type );
      }
      
      /**
       * Returns whether an event will trigger.
       */
      public function willTrigger(type:String) : Boolean 
      {
         return eventDispatcher.willTrigger( type );
      }
		
      /**
       * Simplified dispatch call
       */
	public function dispatch(event:String, callbackEvent:String = null, callback:Function = null):void {
		if(callbackEvent != null) {
			addEventListener(callbackEvent, callback);
		}
		dispatchEvent(new CairngormEvent(event));
	}


	}
}