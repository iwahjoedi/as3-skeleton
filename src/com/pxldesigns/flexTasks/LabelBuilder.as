package com.pxldesigns.flexTasks
{
	/**
	 * This class is used to create a string label for the Flex Tasks application 
	 * @author Dave Flatley
	 * 
	 */	
	[Bindable]
	public class LabelBuilder
	{
		public function LabelBuilder()
		{
			
		}
		
		/**
		 * This method returns a literal string to use as the text for a Label componenet  
		 * @return String 
		 * 
		 */		
		public function buildLabel():String
		{
			return "Flex Tasks are cool!";
		}

	}
}