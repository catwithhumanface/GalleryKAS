const Toast = Swal.mixin({
   	  toast: true,
   	  position: 'top-end',
   	  showConfirmButton: false,
   	  timer: 3000,
   	  timerProgressBar: true,
   	  onOpen: (toast) => {     	
   	    toast.addEventListener('mouseenter', Swal.stopTimer)
   	    toast.addEventListener('mouseleave', Swal.resumeTimer)
   	  }
   	})
	function logout() {
   		Toast.fire({
   	  	icon: 'info',
   	  	title: '로그아웃 되었어요.'
   		}).then(function() {
	           location.href = "member.kas?m=out";
		});
   	}