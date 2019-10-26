<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\FichaTerminologica */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Ficha Terminologicas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="ficha-terminologica-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'area_id',
            'subarea_id',
            'pais_id',
            'temino_origen:ntext',
            'termino_meta:ntext',
            'definicion_origen:ntext',
            'definicion_meta:ntext',
            'fuente_origen:ntext',
            'fuente_meta:ntext',
            'contexto_origen:ntext',
            'contexto_meta:ntext',
            'no_recomendado:ntext',
            'notas_fichat:ntext',
            'url_imagen:url',
            'url_video:url',
            'url_sonido:url',
            'create_at',
            'update_at',
        ],
    ]) ?>

</div>
