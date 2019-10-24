<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */

$this->title = 'Create Ficha Terminologica';
$this->params['breadcrumbs'][] = ['label' => 'Ficha Terminologicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ficha-terminologica-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
