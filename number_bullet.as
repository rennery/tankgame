package {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class number_bullet extends Sprite implements models{
public var sc:int;
		public var pctText1,pctText:TextField;
		public function number_bullet() {
			// constructor code
			sc=20;
			var tf:TextFormat = new TextFormat("Arial, Helvetica", 10, 0x000000, true);
			tf.align = "center";
			pctText = new TextField();
			
			pctText.selectable = false;
			pctText.autoSize = "center";
			pctText.width = 300;
			pctText.defaultTextFormat = tf;
			pctText.x = 40;
			pctText.y = 70;
			pctText.text="You have "+sc+" bullets";
		}
		public function update(i:int){
			if(i>0)
			pctText.text="bullets: "+i+" ";
			else
			pctText.text="You have 0 bullets";
		}
	}
	
}
