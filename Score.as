package {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class Score extends Sprite implements models{
        public var sc:int;
		public var pctText1,pctText:TextField;
		public function Score() {
			// constructor code
			sc=0;
			var tf:TextFormat = new TextFormat("Arial, Helvetica", 10, 0x000000, true);
			tf.align = "center";
			pctText = new TextField();
			
			pctText.selectable = false;
			pctText.autoSize = "center";
			pctText.width = 300;
			pctText.defaultTextFormat = tf;
			pctText.x = 40;
			pctText.y = 40;
			pctText.text="Your Score is"+sc;
			
			
			var tf1:TextFormat = new TextFormat("Arial, Helvetica", 34, 0xFFFFFF, true);
			tf1.align = "center";
			pctText1 = new TextField();
			
			pctText1.selectable = false;
			pctText1.autoSize = "center";
			pctText1.width = 300;
			pctText1.defaultTextFormat = tf1;
			pctText1.x = 700;
			pctText1.y = 40;
			pctText1.text="congratulation!You passed the level 1! Your Score is "+sc;
		}
		public function getScore(){
			return sc;
		}
		public function setScore(s:int){
			sc=s;
		}
		public function getpctText1(i:int):TextField{
			if(i==1)
			
			pctText1.text="congratulation!\nYou passed the level 1!\n Your Score is "+sc;
			else if(i==3){
			pctText1.text="You lose!\nPlease try again!\n Your Score is "+sc;
			trace("dsadd0000000");
			}
			else 
			pctText1.text="congratulation!\nYou passed the level 2!\n Your Score is "+sc+"\nYou can play again by \n click next button";
			return pctText1;
		}
	}
	
}
