package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	[SWF(width="1024",height="548",frameRate="60",backgroundColor="#ffffff")]
	public class mainclass extends Sprite{
		private var v:view_t;
		private var con:Control;
		private var are:Arena;
		public function mainclass() {
			// constructor code
			v=new view_t();
			con=new Control();
			are=new Arena();
			are.replay=0;
			are.LV1();
			v.getView(con);
			v.setArena(are);
			con.getAre(are);
			con.getcon(v);
			v.setWelcome();
			addChild(v);

			stage.addEventListener(MouseEvent.CLICK,con.dosth);
			
		}

	}
	
}
