package com.kpi.interfaces.customControl
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import mx.binding.utils.BindingUtils;
	import mx.controls.Label;
	import mx.core.Container;
	import mx.core.UIComponent;

	
	public class ComponentBinding
	{
		public var container:Container;
		public var label:Label;
		public var property:String;
		public var caller:UIComponent;

		public function ComponentBinding(caller:UIComponent, prop:String, container:Container,  label:Label = null):void {
			this.property = prop;
			this.label = label;
			this.container = container;
			this.caller = caller;
	
			BindingUtils.bindSetter(change, caller, prop);

		}
		
		public function change(o:Object):void {

			
			if(o is String && label != null) {
				label.text = o as String;
				label.visible = true;
				if(container != null) {
					container.visible = false;
					container.includeInLayout = false;
				}
				
			} else if(o is Array) {
				if(label != null) {
					label.visible = false;
					label.includeInLayout = false;
				}
				
				container.visible = true;
				container.includeInLayout = true;
				container.removeAllChildren();
				
				for each(var dis:DisplayObject in o) {
					container.addChild(dis);
				}
				
			} else if (o is DisplayObject) {
				if(label != null) {
					label.visible = false;
					label.includeInLayout = false;
				}
				container.visible = true;
				container.includeInLayout = true;
				container.removeAllChildren();
				container.addChild(o as DisplayObject);
			}
		}
	}
}