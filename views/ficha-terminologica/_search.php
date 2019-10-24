<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologicaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ficha-terminologica-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'area_id') ?>

    <?= $form->field($model, 'subarea_id') ?>

    <?= $form->field($model, 'pais_id') ?>

    <?= $form->field($model, 'temino_origen') ?>

    <?php // echo $form->field($model, 'termino_meta') ?>

    <?php // echo $form->field($model, 'definicion_origen') ?>

    <?php // echo $form->field($model, 'definicion_meta') ?>

    <?php // echo $form->field($model, 'fuente_origen') ?>

    <?php // echo $form->field($model, 'fuente_meta') ?>

    <?php // echo $form->field($model, 'contexto_origen') ?>

    <?php // echo $form->field($model, 'contexto_meta') ?>

    <?php // echo $form->field($model, 'no_recomendado') ?>

    <?php // echo $form->field($model, 'notas_fichat') ?>

    <?php // echo $form->field($model, 'url_imagen') ?>

    <?php // echo $form->field($model, 'url_video') ?>

    <?php // echo $form->field($model, 'url_sonido') ?>

    <?php // echo $form->field($model, 'create_at') ?>

    <?php // echo $form->field($model, 'update_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
