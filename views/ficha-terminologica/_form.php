<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\tinymce\TinyMce;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ficha-terminologica-form">

    <?php $form = ActiveForm::begin(['options'=>['enctype'=>'multiplart/form-data']]); ?>
    
    <?= $form->field($model, 'subarea_id')->textInput() ?>

    <?= $form->field($model, 'pais_id')->textInput() ?>

    <?= $form->field($model, 'temino_origen')->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'termino_meta')->textarea(['rows' => 2]) ?>

    
    <?= $form->field($model, 'definicion_origen')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        ]
    ]);?>

    <?= $form->field($model, 'definicion_meta')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>

    <?= $form->field($model, 'fuente_origen')->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'fuente_meta')->textarea(['rows' => 2]) ?>
    
    <?= $form->field($model, 'contexto_origen')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>    
    
    <?= $form->field($model, 'contexto_meta')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?> 

    <?= $form->field($model, 'no_recomendado')->textarea(['rows' => 3]) ?>
    
    <?= $form->field($model, 'notas_fichat')->widget(TinyMce::className(), [
    'options' => ['rows' => 6],
    'language' => 'es',
    'clientOptions' => [
        'plugins' => [
            "advlist autolink lists link charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    ]
    ]);?>     

    
    
    <?= $form->field($model, 'url_imagen')->widget(FileInput::classname(), [
    'options' => ['accept' => 'image/*'],
    ]);?>

    <?= $form->field($model, 'url_video')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'url_sonido')->textInput(['maxlength' => true]) ?>


    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
