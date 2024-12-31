<!-- Messages -->
<div class="row justify-content-center">
	<@s.iterator value="actionMessages">
	<div class="col col-xl-6">
		<div class="alert alert-success alert-dismissible fade show mt-3"
			role="alert">
			<@s.property/>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Cerrar"></button>
		</div>
	</div>
	</@s.iterator>
</div>