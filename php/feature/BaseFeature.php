<?php
declare(strict_types=1);

// ArulsIp SDK base feature

class ArulsIpBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(ArulsIpContext $ctx, array $options): void {}
    public function PostConstruct(ArulsIpContext $ctx): void {}
    public function PostConstructEntity(ArulsIpContext $ctx): void {}
    public function SetData(ArulsIpContext $ctx): void {}
    public function GetData(ArulsIpContext $ctx): void {}
    public function GetMatch(ArulsIpContext $ctx): void {}
    public function SetMatch(ArulsIpContext $ctx): void {}
    public function PrePoint(ArulsIpContext $ctx): void {}
    public function PreSpec(ArulsIpContext $ctx): void {}
    public function PreRequest(ArulsIpContext $ctx): void {}
    public function PreResponse(ArulsIpContext $ctx): void {}
    public function PreResult(ArulsIpContext $ctx): void {}
    public function PreDone(ArulsIpContext $ctx): void {}
    public function PreUnexpected(ArulsIpContext $ctx): void {}
}
