package com.kpi.cairngorm.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	[Bindable]
	public class ModelLocator implements IModelLocator {
		// Single Instance of Our ModelLocator
		private static var instance:ModelLocator;
		public function ModelLocator() {
			this.addEdit = new AddEdit();
			this.search = new Search();
		}
		// Returns the Single Instance
		public static function Global() : ModelLocator {
			if (instance == null) {
				instance = new ModelLocator();
				instance.session = Session.Global();
			}
			return instance;
		}
		
		/* Session Vars */
		public var session:Session;		
		
		/* Values to AddEdit */
		public var addEdit:AddEdit;
		
		/* Values to Search */
		public var search:Search;
		
		
	}
}
// Utility Class to Deny Access to Constructor

