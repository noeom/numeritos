<!-- Errors -->
<div class="row justify-content-center">
	<@s.iterator value="userErrors">
	<div class="col col-xl-6">
		<div class="alert alert-danger alert-dismissible fade show mt-3"
			role="alert">
			<@s.property/>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Cerrar"></button>
		</div>
	</div>
	</@s.iterator>
</div>