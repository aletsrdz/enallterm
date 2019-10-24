<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Inscrito */

$this->title = 'Create Inscrito';
$this->params['breadcrumbs'][] = ['label' => 'Inscritos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inscrito-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
