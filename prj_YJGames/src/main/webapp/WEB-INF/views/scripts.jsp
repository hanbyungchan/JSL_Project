<%@ page pageEncoding="UTF-8"%>
<script type="text/javascript">
    	function goSignIn() {
    		game.method="post";
    		game.action="Game?t_gubun=goSignin";
    		game.submit();	
		}
    	function goInfo() {
    		game.method="post";
    		game.action="Game?t_gubun=userinfo";
    		game.submit();
		}
    	function goLogout() {
    		game.method="post";
    		game.action="Game?t_gubun=userlogout";
    		game.submit();
		}
    	function goLibrary() {
    		game.method="post";
    		game.action="Game?t_gubun=library";
    		game.submit();
		}
    	function goReview() {
    		game.method="post";
    		game.action="Game?t_gubun=myreview";
    		game.submit();
		}
    	function goGameRegi() {
    		game.method = "post";
    		game.action = "Game?t_gubun=gameRegistForm";
    		game.submit();
    	}
    </script>