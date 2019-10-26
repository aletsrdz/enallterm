<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ficha-terminologica-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'area_id')->textInput() ?>

    <?= $form->field($model, 'subarea_id')->textInput() ?>

    <?= $form->field($model, 'pais_id')->textInput() ?>

    <?= $form->field($model, 'temino_origen')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'termino_meta')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'definicion_origen')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'definicion_meta')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fuente_origen')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fuente_meta')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'contexto_origen')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'contexto_meta')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'no_recomendado')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'notas_fichat')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'url_imagen')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_video')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_sonido')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'create_at')->textInput() ?>

    <?= $form->field($model, 'update_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
