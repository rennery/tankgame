package  {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class Lv_show extends Sprite implements models{
 public var sc:int;
		public var pctText1,pctText:TextField;
		public function Lv_show() {
			// constructor code
			sc=0;
			var tf:TextFormat = new TextFormat("Arial, Helvetica", 12, 0xFFFFFF, true);
			tf.align = "center";
			pctText = new TextField();
			
			pctText.selectable = false;
			pctText.autoSize = "center";
			pctText.width = 300;
			pctText.defaultTextFormat = tf;
			pctText.x = 40;
			pctText.y = 20;
			pctText.text="LEVEL : "+sc;
		}
		public function getpctText1(i:int):TextField{
			pctText.text="LEVEL : "+i;
			return pctText;
		}
	}
	
}
