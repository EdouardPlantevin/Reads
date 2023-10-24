<?php

namespace App\Tests;

use App\Utils\StringUtils;
use PHPUnit\Framework\TestCase;

class StringUtilsTest extends TestCase
{
    public function testSlugify()
    {
        $this->assertEquals('hello-world', StringUtils::slugify('Hello World!'));
        $this->assertEquals('foo-bar', StringUtils::slugify('foo.bar!'));
        $this->assertEquals('baz', StringUtils::slugify('<baz>'));
        $this->assertEquals('i-am-a-programmer', StringUtils::slugify('I am a programmer.'));
        $this->assertEquals('programming-rocks', StringUtils::slugify('Programming ROCKS!'));
    }
    public function testCamelize()
    {
        $this->assertEquals('HelloWorld', StringUtils::camelize('hello_world'));
        $this->assertEquals('FooBarBaz', StringUtils::camelize('foo_bar_baz', '_'));
        $this->assertEquals('HelloWorld', StringUtils::camelize('hello-world', '-'));
        $this->assertEquals('IPHPAmAProgrammer', StringUtils::camelize('i_am_a_programmer'));
        $this->assertEquals('ProgrammingRocks', StringUtils::camelize('programming_rocks', '_'));
    }
    public function testCamelToSnakeCase()
    {
        $this->assertEquals('hello_world', StringUtils::camelToSnakeCase('helloWorld'));
        $this->assertEquals('foo_bar_baz', StringUtils::camelToSnakeCase('fooBarBaz'));
        $this->assertEquals('i_am_a_programmer', StringUtils::camelToSnakeCase('IAmAProgrammer'));
        $this->assertEquals('programming_rocks', StringUtils::camelToSnakeCase('ProgrammingROCKS'));
    }
    public function testRemoveAccent()
    {
        $this->assertEquals('hello', StringUtils::removeAccent('héllo'));
        $this->assertEquals('aeiou', StringUtils::removeAccent('àéïöù'));
        $this->assertEquals('Mr Glubulu', StringUtils::removeAccent('Mr Glübülü'));
        $this->assertEquals('Lorem Ipsum', StringUtils::removeAccent('Lörèm Ìpsüm'));
    }
}