<?php

namespace App\DataFixtures;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Publisher;
use App\Entity\Status;
use App\Entity\User;
use App\Entity\UserBook;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory as Faker;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker::create('fr_FR');

        // Creation of 10 Authors
        $authors = [];
        for ($i = 0; $i < 10; $i++) {
            $author = new Author();
            $author->setName($faker->name);
            $manager->persist($author);
            $authors[] = $author;
        }

        // Creation of 10 Publisher
        $publishers = [];
        for ($i = 0; $i < 10; $i++) {
            $publisher = new Publisher();
            $publisher->setName($faker->name);
            $manager->persist($publisher);
            $publishers[] = $publisher;
        }

        // Creation status
        $status = [];
        foreach (['to-read', 'reading', 'read'] as $value) {
            $oneStatus = new Status();
            $oneStatus->setName($value);
            $manager->persist($oneStatus);
            $status[] = $oneStatus;
        }

        // Creation of 100 Books
        $books = [];
        for ($i = 0; $i < 100; $i++) {
            $book = new Book();
            $book->setTitle($faker->sentence)
                ->setGoogleBooksId($faker->uuid)
                ->setSubtitle($faker->sentence)
                ->setPublishDate($faker->dateTime)
                ->setDescription($faker->text)
                ->setIsbn10($faker->isbn10)
                ->setIsbn13($faker->isbn13)
                ->setPageCount($faker->numberBetween(100, 1000))
                ->setSmallThumbnail('https://picsum.photos/100/150')
                ->setThumbnail('https://picsum.photos/200/300')
                ->addAuthor($faker->randomElement($authors))
                ->addPublisher($faker->randomElement($publishers))
            ;
            $manager->persist($book);
            $books[] = $book;
        }


        //Creation of 10 Users
        $users = [];
        for ($i = 0; $i < 10; $i++) {
            $user = new User();
            $user->setEmail($faker->email)
                ->setPassword($faker->password)
                ->setPseudo($faker->userName)
                ->setRoles(['ROLE_USER'])
            ;
            $manager->persist($user);
            $users[] = $user;
        }


        //Creation of 10 UserBooks by User
        foreach ($users as $user) {
            for ($i = 0; $i < 10; $i++) {
                $userBook = new UserBook();
                $userBook->setReader($user)
                    ->setBook($faker->randomElement($books))
                    ->setStatus($faker->randomElement($status))
                    ->setComment($faker->text)
                    ->setRating($faker->numberBetween(0, 5))
                    ->setCreatedAt(\DateTimeImmutable::createFromMutable($faker->dateTime))
                    ->setUpdatedAt(\DateTimeImmutable::createFromMutable($faker->dateTime))
                ;
                $manager->persist($userBook);
            }
        }

        $manager->flush();
    }
}
