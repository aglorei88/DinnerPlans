<div class="row">
	<form id="create_listing" enctype="multipart/form-data" action="/meals/create_listing/<?= $this->session->userdata['id'] ?>" method="post">
		<div class="col-sm-12 col-md-6">
			<h4>Create a listing with us!</h4>
			<!-- Meal -->
			<label class="text" for="meal">Meal title:</label>
<?php		if (isset($errors['meal']))
			{
				echo $errors['meal'];
			} ?>
			<input class="form-control" type="text" name="meal" value="<?php if (isset($errors_input['meal'])) { echo $errors_input['meal']; } ?>" />
			<!-- Description -->
			<label class="text" for="description">Meal description:</label>
<?php		if (isset($errors['description']))
			{
				echo $errors['description'];
			} ?>
			<textarea class="form-control" name="description" /><?php if (isset($errors_input['description'])) { echo $errors_input['description']; } ?></textarea>
			<!-- Category -->
			<label class="text" for="category_id">Category:</label>
<?php		if (isset($errors['category_id']))
			{
				echo $errors['category_id'];
			} ?>
			<select name="category_id" class="form-control">
				<option value="1">North African</option>
				<option value="2">American</option>
				<option value="3">French</option>
				<option value="4">Tapas</option>
				<option value="5">Indian</option>
				<option value="7">Comfort Food</option>
				<option value="8">Italian</option>
			</select>
			<!-- Options -->
			<label class="text" for="options">Dietary Options:</label>
<?php		if (isset($errors['options']))
			{
				echo $errors['options'];
			} ?><br>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox1" name="options[]" value="1"> Vegetarian
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox2" name="options[]" value="2"> Vegan
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox2" name="options[]" value="3"> Gluten-free
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox2" name="options[]" value="4"> Dairy-free
			</label>
			<label class="checkbox-inline">
				<input type="checkbox" id="inlineCheckbox3" name="options[]" value="5"> Paleo
			</label><br>
		</div>
		<div class="col-sm-12 col-md-6">
			<!-- Image Upload -->
			<label class="text" for="image">Image:</label>
<?php		if (isset($errors['image']))
			{
				echo $errors['image'];
			} ?><br>
			<div class="file-upload btn blue">
				<span>Browse</span><input type="file" name="image" size="10" />
			</div>
			<input id="uploadFile" placeholder="Choose File" disabled="disabled" /><br>
			<!-- Initial Price -->
			<label class="text" for="initial_price">Starting price for the bids:</label>
<?php		if (isset($errors['initial_price']))
			{
				echo $errors['initial_price'];
			} ?>
			<div class="input-group">
				<div class="input-group-addon">$</div>
				<input class="form-control" type="number" min="0" name="initial_price" value="<?php if (isset($errors_input['initial_price'])) { echo $errors_input['initial_price']; } ?>" />
				<div class="input-group-addon">.00</div>
			</div>
			<!-- Duration -->
			<label class="text" for="duration">Duration of bidding (days):</label>
<?php		if (isset($errors['duration']))
			{
				echo $errors['duration'];
			} ?>
			<input class="form-control" type="number" min="0" name="duration" value="<?php if (isset($errors_input['duration'])) { echo $errors_input['duration']; } ?>" />
			<!-- Meal Date -->
			<label class="text" for="meal_date">Event Date:</label>
<?php		if (isset($errors['meal_date']))
			{
				echo $errors['meal_date'];
			} ?>
			<input class="form-control" type="datetime-local" name="meal_date" value="<?php if (isset($errors_input['meal_date'])) { echo $errors_input['meal_date']; } ?>" />

			<!-- Submit Form -->
			<input class="btn blue" type="submit" value="Plan it!" />
		</div>
	</form>
</div>