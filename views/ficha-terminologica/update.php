<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */

$this->title = 'Update Ficha Terminologica: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Ficha Terminologicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ficha-terminologica-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
