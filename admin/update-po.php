<?php 
include "../conn.php";
if(isset($_POST['update'])){
				$nopo	       = $_POST['nopo'];
                $tanggalkirim  = $_POST['tanggalkirim'];
                $status        = $_POST['status'];
				
				$update = mysqli_query($koneksi, "UPDATE po SET tanggalkirim='$tanggalkirim', status='$status' WHERE nopo='$nopo'") or die(mysqli_error());
				if($update){
					echo "<script>alert('Data PO Berhasil diupdate!'); window.location = 'po.php'</script>";
				}else{
					echo '<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Data gagal disimpan, silahkan coba lagi.</div>';
				}
			}
            ?>