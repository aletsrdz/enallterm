<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Subareas */

$this->title = 'Create Subareas';
$this->params['breadcrumbs'][] = ['label' => 'Subareas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="subareas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
