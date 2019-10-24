<?php

use yii\helpers\Html;

$this->title = 'Checar los permisos';
$this->params['breadcrums'][] = $this->title;
$this->registerCss('
	.allowed-permission{
		color: green;
	}

	.forbidden-permission{
		color: red;
	}');
?>

<div class="site-about">
	<h1><?= Html::encode($this->title) ?></h1>

	<p>Usuarios del sistema con permisos</p>

	<?php foreach ($users as $user) : ?>
		<div class="col-md-3">
				<h2><?= ucfirst($user->username) . " Permissions"; ?></h2>

				<?php foreach($permissions as $permission) : ?>
					<p>
						<strong>
							<?php
							echo $permission->name . ' permission: ';
							if(Yii::$app->authManager->checkAccess($user->id, $permission->name))
								echo '<span class="allowed-permission">YES</span>';
							else
								echo '<span class="forbidden-permission">NO</span>';?>
						</strong>	
					</p>
				<?php endforeach; ?>
		</div>
	<?php endforeach; ?>			

</div>	