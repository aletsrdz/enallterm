<?php

use yii\db\Migration;

/**
 * Class m191001_162230_create_table_pais
 */
class m191001_162230_create_table_pais extends Migration
{
    /**
     * {@inheritdoc}
     */
    /*
    public function safeUp()
    {

    }

    /**
     * {@inheritdoc}
     */
    /*
    public function safeDown()
    {
        echo "m191001_162230_create_table_pais cannot be reverted.\n";

        return false;
    }

    */
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable('pais', [
            'id' => $this->primaryKey()->unsigned(),
            'nombre' => $this->string(100)->notnull(),
            'abreviatura' => $this->string(50)->notnull(),

        ]);

    }

    public function down()
    {
        $this->dropTable('pais');
    }
    
}
